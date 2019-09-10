defmodule CreggWeb.EggLive do
  use Phoenix.LiveView

  import Ecto.Query, only: [from: 2]

  alias Cregg.Repo
  alias Cregg.Cracks

  def render(assigns) do
    CreggWeb.PageView.render("index.html", assigns)
  end
  
  def mount(_session, socket) do
    if connected?(socket), do: Process.send_after(self(), :tick, 1000)
    cracks = get_cracks().cracks
    {:ok, assign(socket, count: cracks, egg: get_egg(cracks))}
  end
  
  def handle_info(:tick, %{assigns: %{count: count, egg: egg}} = socket) do
    Process.send_after(self(), :tick, 1000)

    case get_cracks().cracks do
      ^count -> # no new cracks
        {:noreply, socket}
      cracks ->
        case get_egg(cracks) do
          ^egg -> # no new egg
            {:noreply, assign(socket, count: cracks)}
          new_egg ->
            {:noreply, assign(socket, count: cracks, egg: new_egg)}
        end
    end
  end
  
  def handle_event("crack", _, %{assigns: %{egg: egg}} = socket) do
    id = get_cracks().id
    from(cracks in Cracks, update: [inc: [cracks: 1]]) |> Repo.update_all([])
    
    cracks = get_cracks().cracks

    case get_egg(cracks) do
      ^egg -> # no new egg
        {:noreply, assign(socket, count: cracks)}
      new_egg ->
        {:noreply, assign(socket, count: cracks, egg: new_egg)}
    end
  end

  defp get_cracks() do
    case Repo.one(Cracks) do
      nil ->
        Repo.insert(%Cracks{cracks: 0})
      cracks ->
        cracks
    end
  end

  defp get_egg(cracks) do
    n = (cracks / 1000) |> Kernel.trunc
    if n >= 1000 do # cregg has been cracked
      "/images/cregg.webp"
    else
      "/images/egg#{n}.webp"
    end
  end
end

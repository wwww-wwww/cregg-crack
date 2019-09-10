defmodule CreggWeb.EggLive do
  use Phoenix.LiveView
  
  def render(assigns) do
    CreggWeb.PageView.render("index.html", assigns)
  end
  
  def mount(_session, socket) do
    if connected?(socket), do: Process.send_after(self(), :tick, 1000)
    cracks = Cregg.Cracks.get_cracks(Cracks)
    {:ok, assign(socket, count: cracks, egg: get_egg(cracks))}
  end
  
  def handle_info(:tick, %{assigns: %{count: count, egg: egg}} = socket) do
    Process.send_after(self(), :tick, 1000)
    
    case Cregg.Cracks.get_cracks(Cracks) do
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
    Cregg.Cracks.add_crack(Cracks)

    cracks = Cregg.Cracks.get_cracks(Cracks)

    case get_egg(cracks) do
      ^egg -> # no new egg
        {:noreply, assign(socket, count: cracks)}
      new_egg ->
        {:noreply, assign(socket, count: cracks, egg: new_egg)}
    end
  end

  defp get_egg(cracks) do
    n = (cracks / 1000) |> Kernel.trunc
    if n >= 1000 do # cregg is cracked
      "/images/cregg.webp"
    else
      "/images/egg#{n}.webp"
    end
  end
end

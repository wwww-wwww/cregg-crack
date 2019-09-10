defmodule Cregg.Application do
  use Application

  def start(_type, _args) do
    children = [
      Cregg.Repo,
      CreggWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: Cregg.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    CreggWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

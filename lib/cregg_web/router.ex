defmodule CreggWeb.Router do
  use CreggWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", CreggWeb do
    pipe_through :browser

    live "/", EggLive
  end
end

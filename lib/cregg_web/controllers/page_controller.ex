defmodule CreggWeb.PageController do
  use CreggWeb, :controller

  def index(conn, _params) do
    live_render(conn, CreggWeb.EggView, session: %{})
  end
end

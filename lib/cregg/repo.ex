defmodule Cregg.Repo do
  use Ecto.Repo,
    otp_app: :cregg,
    adapter: Ecto.Adapters.Postgres
end
  
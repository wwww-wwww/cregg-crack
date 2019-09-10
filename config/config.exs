use Mix.Config

config :cregg,
  ecto_repos: [Cregg.Repo]

config :cregg, CreggWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "w99B3bt1CUTvkQ6vKu4WM6vWzviClCssLK2M3KnUzNBI0I/f1L4m+I6dKsT36Iq8",
  render_errors: [view: CreggWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Cregg.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "PIx88yu/OCNffQ3fl4w0/3ip/66MF+Pv"
  ]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"

use Mix.Config

config :cregg, CreggWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ck9KA3jWCeqTYaLtEhH3Vj+SDuGi0tVt4MtvrbSfK3ZW9DRMog1K/UUQ8aGF6fXS",
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

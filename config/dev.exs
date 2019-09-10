use Mix.Config

config :cregg, Cregg.Repo,
  username: "cregg",
  password: "cregg",
  database: "cregg",
  hostname: "192.168.1.51",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :cregg, CreggWeb.Endpoint,
  http: [port: 17002],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js",
      "--mode",
      "development",
      "--watch-stdin",
      cd: Path.expand("../assets", __DIR__)
    ]
  ]

config :cregg, CreggWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/cregg_web/{live,views}/.*(ex)$",
      ~r"lib/cregg_web/templates/.*(eex)$"
    ]
  ]

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20

config :phoenix, :plug_init_mode, :runtime

use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :kegcopr_api, KegCopRAPI.Web.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: []

# ## SSL Support
#
# In order to use HTTPS in development, a self-signed
# certificate can be generated by running the following
# command from your terminal:
#
#     openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com" -keyout priv/server.key -out priv/server.pem
#
# The `http:` config above can be replaced with:
#
#     https: [port: 4000, keyfile: "priv/server.key", certfile: "priv/server.pem"],
#
# If desired, both `http:` and `https:` keys can be
# configured to run both http and https servers on
# different ports.

# Watch static and templates for browser reloading.
config :kegcopr_api, KegCopRAPI.Web.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{lib/kegcopr_api/web/views/.*(ex)$},
      ~r{lib/kegcopr_api/web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n",
  backends: [{LoggerFileBackend, :error_log}, :console]

config :logger, :error_log,
  path: "log/error.log",
  level: :error

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :kegcopr_api, KegCopRAPI.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "kegcopr_api_dev",
  hostname: "localhost",
  pool_size: 10

config :guardian, Guardian,
  secret_key: "H2PEn86P7xUFrH6NlfD6rEJiST2BnzlDiXJTlcSxDfULj12j/e9yP+lxOkIWltwX"

# config :logger, format: "[$level] $message\n",

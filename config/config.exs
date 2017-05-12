# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :kegcopr_api,
  namespace: KegCopRAPI,
  ecto_repos: [KegCopRAPI.Repo]

# Configures the endpoint
config :kegcopr_api, KegCopRAPI.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "fIEpvi5ujSQEKgmkRpt83KiLPq068sSmvFKlWFZyNpi3nkNmUtYO24Em6cXIUblZ",
  render_errors: [view: KegCopRAPI.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: KegCopRAPI.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger,
  backends: [:console, {LoggerFileBackend, :error_log}],
  format: "[$level] $message\n"
  # format: "$time $metadata[$level] $message\n",
  # metadata: [:request_id]

# configuration for the {LoggerFileBackend, :error_log} backend
config :logger, :error_log,
  # path: "/home/deploy/deployments/kegcopr_api/error.log",
  path: "/tmp/kegcopr_api-error.log"
  level: :error

# configure guardian
config :guardian, Guardian,
  issuer: "KegCopRAPI",
  ttl: {30, :days},
  verify_issuer: true,
  serializer: KegCopRAPI.GuardianSerializer

# configure distillery
config :distillery,
  no_warn_missing: true

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

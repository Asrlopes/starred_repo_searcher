# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :brainn,
  ecto_repos: [Brainn.Repo]

# Configures the endpoint
config :brainn, BrainnWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xP2i51sGLNoMEbd5WDSDu3dZDdg0s0wlpmlEaSYFbjyAK7Mb52mfA2YzOkPoymch",
  render_errors: [view: BrainnWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Brainn.PubSub,
  live_view: [signing_salt: "/PfZKPU5"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

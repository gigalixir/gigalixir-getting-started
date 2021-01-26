# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :gigalixir_getting_started,
  ecto_repos: [GigalixirGettingStarted.Repo]

# Configures the endpoint
config :gigalixir_getting_started, GigalixirGettingStartedWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NN+BYtY5izudeYPOt7aH9r+6Qt3LoZtw53+aHCtLHwb+OhRmr8XBds7QA18tFkzv",
  render_errors: [view: GigalixirGettingStartedWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: GigalixirGettingStarted.PubSub,
  live_view: [signing_salt: "pF3z90PM"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

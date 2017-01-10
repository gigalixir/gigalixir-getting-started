# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :gigalixir_getting_started,
  ecto_repos: [GigalixirGettingStarted.Repo]

# Configures the endpoint
config :gigalixir_getting_started, GigalixirGettingStarted.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "71noA/0cCGKiKi8COvvTQIPb8AgRHnvR3FxfTqFG/WYInJrem52UA8MpcDYx17rk",
  render_errors: [view: GigalixirGettingStarted.ErrorView, accepts: ~w(html json)],
  pubsub: [name: GigalixirGettingStarted.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

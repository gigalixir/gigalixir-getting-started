use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :gigalixir_getting_started, GigalixirGettingStartedWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :gigalixir_getting_started, GigalixirGettingStarted.Repo,
  username: "postgres",
  password: "postgres",
  database: "gigalixir_getting_started_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

defmodule GigalixirGettingStarted.Repo do
  use Ecto.Repo,
    otp_app: :gigalixir_getting_started,
    adapter: Ecto.Adapters.Postgres
end

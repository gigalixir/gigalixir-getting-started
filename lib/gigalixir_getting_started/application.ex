defmodule GigalixirGettingStarted.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      GigalixirGettingStartedWeb.Telemetry,
      GigalixirGettingStarted.Repo,
      {DNSCluster, query: Application.get_env(:gigalixir_getting_started, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: GigalixirGettingStarted.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: GigalixirGettingStarted.Finch},
      # Start a worker by calling: GigalixirGettingStarted.Worker.start_link(arg)
      # {GigalixirGettingStarted.Worker, arg},
      # Start to serve requests, typically the last entry
      GigalixirGettingStartedWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GigalixirGettingStarted.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GigalixirGettingStartedWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

defmodule GigalixirGettingStarted.CodeChanger do
  use GenServer
  use Logger

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    {:ok, "v0.0.1"}
  end

  def version(server) do
    GenServer.call(server, nil)
  end

  def handle_call(_any, _from, version) do
    {:reply, version, version}
  end

  def code_change(_old_vsn, _old_state, _extra) do
    Logger.debug "code_change executing"
    {:ok, "v0.0.2"}
  end
end
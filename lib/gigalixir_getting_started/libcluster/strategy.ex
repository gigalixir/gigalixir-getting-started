defmodule GigalixirGettingStarted.Libcluster.Strategy do
  use GenServer
  use Cluster.Strategy
  import Cluster.Logger

  alias Cluster.Strategy.State

  @default_polling_interval 5_000

  def start_link(opts), do: GenServer.start_link(__MODULE__, opts)
  def init(opts) do
    state = %State{
      topology: Keyword.fetch!(opts, :topology),
      connect: Keyword.fetch!(opts, :connect),
      disconnect: Keyword.fetch!(opts, :disconnect),
      config: Keyword.fetch!(opts, :config),
      meta: MapSet.new([])
    }
    {:ok, state, 0}
  end

  def handle_info(:timeout, state) do
    handle_info(:load, state)
  end
  def handle_info(:load, %State{topology: topology, connect: connect, disconnect: disconnect} = state) do
    new_nodelist = MapSet.new(get_nodes(state))
    added        = MapSet.difference(new_nodelist, state.meta)
    removed      = MapSet.difference(state.meta, new_nodelist)
    new_nodelist = case Cluster.Strategy.disconnect_nodes(topology, disconnect, MapSet.to_list(removed)) do
                :ok ->
                  new_nodelist
                {:error, bad_nodes} ->
                  # Add back the nodes which should have been removed, but which couldn't be for some reason
                  Enum.reduce(bad_nodes, new_nodelist, fn {n, _}, acc ->
                    MapSet.put(acc, n)
                  end)
              end
    new_nodelist = case Cluster.Strategy.connect_nodes(topology, connect, MapSet.to_list(added)) do
              :ok ->
                new_nodelist
              {:error, bad_nodes} ->
                # Remove the nodes which should have been added, but couldn't be for some reason
                Enum.reduce(bad_nodes, new_nodelist, fn {n, _}, acc ->
                  MapSet.delete(acc, n)
                end)
            end
    Process.send_after(self(), :load, Keyword.get(state.config, :polling_interval, @default_polling_interval))
    {:noreply, %{state | :meta => new_nodelist}}
  end
  def handle_info(_, state) do
    {:noreply, state}
  end

  @spec get_nodes(State.t) :: [atom()]
  defp get_nodes(%State{topology: topology, config: config}) do
    config
    |> Keyword.get(:url)
    |> HTTPoison.get!
    |> Map.get(:body)
    |> Poison.decode!
    |> Map.get("data")
    |> Enum.map(&String.to_atom/1)
  end
end

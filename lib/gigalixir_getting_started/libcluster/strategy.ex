defmodule GigalixirGettingStarted.Libcluster.Strategy do
  use GigalixirGettingStarted.Libcluster.PollStrategy

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

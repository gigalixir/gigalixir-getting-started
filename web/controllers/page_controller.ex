defmodule GigalixirGettingStarted.PageController do
  use GigalixirGettingStarted.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def nodes(conn, params) do
    json conn, %{
      data: Node.list ++ [Node.self]
    }
  end

  def connect(conn, params) do
    result = params
    |> Map.get("url")
    |> HTTPoison.get!
    |> Map.get(:body)
    |> Poison.decode!
    |> Map.get("data")
    |> Enum.map(&String.to_atom/1)
    |> Enum.map(&Node.connect/1)

    json conn, %{
      data: result
    }
  end
end

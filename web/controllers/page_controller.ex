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
    url = params["url"]
    response = HTTPoison.get!(url)
    body = response.body
    body = Poison.decode!(body)
    IO.inspect body
    data = body["data"]
    IO.inspect data
    result = data
    |> Enum.map(&String.to_atom/1)
    |> Enum.map(&Node.connect/1)

    IO.inspect result
    json conn, %{
      data: result
    }
  end
end

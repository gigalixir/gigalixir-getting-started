defmodule GigalixirGettingStarted.PageController do
  use GigalixirGettingStarted.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def nodes(conn, params) do
    json conn, %{
      data: Node.list ++ Node.self
    }
  end
end

defmodule GigalixirGettingStartedWeb.PageController do
  use GigalixirGettingStartedWeb, :controller

  def index(conn, _params) do
    json conn, %{node: Node.self}
    # render(conn, "index.html")
  end
end

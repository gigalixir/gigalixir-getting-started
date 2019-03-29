defmodule GigalixirGettingStartedWeb.PageController do
  use GigalixirGettingStartedWeb, :controller

  def index(conn, _params) do
    json conn, %{version: GigalixirGettingStarted.CodeChanger.version(GigalixirGettingStarted.CodeChanger)}
  end
end

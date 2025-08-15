defmodule GigalixirGettingStartedWeb.PageController do
  use GigalixirGettingStartedWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end

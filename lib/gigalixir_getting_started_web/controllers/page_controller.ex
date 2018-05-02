defmodule GigalixirGettingStartedWeb.PageController do
  use GigalixirGettingStartedWeb, :controller

  def index(conn, _params) do
    text conn, Geolix.lookup(conn.remote_ip)
  end
end

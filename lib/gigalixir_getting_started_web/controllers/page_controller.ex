defmodule GigalixirGettingStartedWeb.PageController do
  use GigalixirGettingStartedWeb, :controller

  def index(conn, params) do
    ip = params["ip"] || conn.remote_ip
    json conn, %{ip: inspect(ip), result: inspect(Geolix.lookup(ip))}
  end
end

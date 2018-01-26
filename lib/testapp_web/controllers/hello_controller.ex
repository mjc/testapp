defmodule TestappWeb.HelloController do
  use TestappWeb, :controller

  def index(conn, params) do
    conn |> send_resp(204, "")
  end
end
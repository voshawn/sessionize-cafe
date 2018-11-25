defmodule CafeWeb.PageController do
  use CafeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def code(conn, _params) do
    render(conn, "code.html")
  end
end

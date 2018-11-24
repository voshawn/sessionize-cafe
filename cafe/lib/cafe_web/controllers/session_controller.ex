defmodule CafeWeb.SessionController do
  use CafeWeb, :controller

  def index(conn, _params) do
    render(conn, "test.json", user: "shawn")
  end
end

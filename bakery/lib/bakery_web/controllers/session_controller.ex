defmodule BakeryWeb.SessionController do
  use BakeryWeb, :controller

  def index(conn, _params) do
    conn
    |> render("test.json", user: "shawn")
  end
end


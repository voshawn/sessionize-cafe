defmodule CafeWeb.SessionController do
  use CafeWeb, :controller

  def get(conn, %{"code" => code}) do
    data = Store.get(code)
    render(conn, "data.json", data: data)
  end
  def get(conn, _params) do
    render(conn, "data.json", data: "Invalid URL")
  end

  def store(conn, params) do
    IO.inspect(params)
    code = Store.create(params)
    render(conn, "data.json", data: code)
  end

end

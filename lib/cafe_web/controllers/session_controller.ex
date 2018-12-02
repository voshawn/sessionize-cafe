defmodule CafeWeb.SessionController do
  use CafeWeb, :controller

  def get(conn, %{"iv" => iv, "ct" => ct}) do
    data = Store.get([iv, ct])
    render(conn, "data.json", data: data)
  end
  def get(conn, _params) do
    render(conn, "data.json", data: "Invalid URL")
  end

  def store(conn, params) do
    IO.inspect(params)
    [iv, ct] = Store.create(params)
    render(conn, "data.json", data: %{"iv" => iv, "ct" => ct})
  end

end

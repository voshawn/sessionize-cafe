defmodule CafeWeb.CodeController do
  use CafeWeb, :controller

  def index(conn, %{"iv" => iv, "ct" => ct} = _params) do
    data = Store.get([iv, ct])
    render(conn, "index.html", url: data["url"])
  end

  def index(conn, params) do
    IO.inspect(params)
    render(conn, "invalid.html")
  end

end

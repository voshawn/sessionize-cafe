defmodule CafeWeb.CodeController do
  use CafeWeb, :controller

  def index(conn, %{"id" => code} = params) do
    data = Store.get(code)
    render(conn, "index.html", url: data["url"])
  end

  def index(conn, params) do
    IO.inspect(params)
    render(conn, "invalid.html")
  end

end

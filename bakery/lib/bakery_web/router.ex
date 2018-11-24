defmodule BakeryWeb.Router do
  use BakeryWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BakeryWeb do
    pipe_through :api
    resources "/session", SessionController, except: [:new, :edit]
  end
end

defmodule TestappWeb.Router do
  use TestappWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TestappWeb do
    pipe_through :api
    get "/test", HelloController, :index
  end
end

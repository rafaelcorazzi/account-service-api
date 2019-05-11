defmodule AccountApi.Router do
  use AccountApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AccountApi do
    pipe_through :api
  end
end

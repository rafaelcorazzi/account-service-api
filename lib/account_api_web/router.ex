defmodule AccountApiWeb.Router do
    use AccountApiWeb, :router
  
    pipeline :api do
      plug :accepts, ["json"]
    end

    scope "/", AccountApiWeb do
      pipe_through :api
      resources "/limit", AccountController, only: [:create]
      get "/limit", AccountController, :list
      get "/", AccountController, :index
    end
end
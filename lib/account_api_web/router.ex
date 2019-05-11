defmodule AccountApiWeb.Router do
    use AccountApiWeb, :router
  
    pipeline :api do
      plug :accepts, ["json"]
    end

    scope "/", AccountApiWeb do
      pipe_through :api
      get "/businesses", AccountController, :list
      get "/", AccountController, :index
    end
end
defmodule AccountApiWeb.FallbackController do
    @moduledoc """
    Translates controller action results into valid `Plug.Conn` responses.
    See `Phoenix.Controller.action_fallback/1` for more details.
    """
    use AccountApiWeb, :controller
  
    def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
      conn
      |> put_status(:unprocessable_entity)
      |> render(AccountApiWeb.ChangesetView, "error.json", changeset: changeset)
    end
  
    def call(conn, {:error, :not_found}) do
      conn
      |> put_status(:not_found)
      |> render(AccountApiWeb.ErrorView, :"404")
    end
  
    def call(conn, {:error, :unauthorized}) do
      conn
      |> put_status(:unauthorized)
      |> render(AccountApiWeb.ErrorView, :"401")
    end
  
    def call(conn, {:error, _}) do
      conn
      |> put_status(:not_allowed)
      |> render(AccountApiWeb.ErrorView, :"400")
    end
  end
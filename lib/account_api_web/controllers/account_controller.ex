defmodule AccountApiWeb.AccountController do
    use AccountApiWeb, :controller

    alias AccountApi.Account
   
    @action_fallback  AccountApiWeb.FallbackController

    def index(conn, _params) do
        text = "OK"
        {:ok, json} = Poison.encode(%{text: text})
        conn
        |> put_resp_header("content-type", "application/json")
        |> send_resp(200, json)
    end
    def create(conn, params) do
        Account.RechargeLimit.create_limit(params)
        conn
        |> put_resp_header("content-type", "application/json")
        |> send_resp(201, "result")
    end
    def list(conn, _) do
        limits = Account.RechargeLimit.list_recharge_limits()
        conn
        |> put_status(:ok)
        |> put_resp_header("content-type", "application/json")
        |> render("index.json", recharge_limit: limits)
    end
end
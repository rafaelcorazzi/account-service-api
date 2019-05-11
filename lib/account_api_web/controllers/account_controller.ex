defmodule AccountApiWeb.AccountController do
    use AccountApiWeb, :controller

    alias AccountApi.Account
    alias AccountApi.Account.RechargeLimit
  
    #action_fallback AccountApiWeb.FallbackController

    def index(conn, _params) do
        text = "OK"
        {:ok, json} = Poison.encode(%{text: text})
        conn
        |> put_resp_header("content-type", "application/json")
        |> send_resp(200, json)
    end

    def list(conn, _) do
        business = Account.list_recharge_limits()
        
        json(conn, %{companies: business})
    end
end
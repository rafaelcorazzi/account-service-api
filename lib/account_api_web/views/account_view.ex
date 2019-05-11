defmodule AccountApiWeb.AccountView do
    use AccountApiWeb, :view
    #alias AccountApiWeb.AccountView
  
    
    def render("index.json", %{recharge_limit: limits}) do
        limits
    end
 end
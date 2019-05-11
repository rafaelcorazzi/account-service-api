defmodule AccountApiWeb.AccountView do
    use AccountApiWeb, :view
    alias AccountApiWeb.AccountView
  
    
  
    def render("show.json", %{business: business}) do
      %{data: render_one(business, BusinessView, "business.json")}
    end
  
    
  end
defmodule AccountApi.Account do
    @moduledoc """
    The Accounts context.
    """
  
    import Ecto.Query, warn: false
  
    alias AccountApi.Repo
    alias AccountApi.Account.RechargeLimit

    def list_recharge_limits do
        Repo.all(
      from c in RechargeLimit,
        where: c.is_active == true,
        select: %{id: c.id, company_id: c.company_id, start_at: c.start_at, amount: c.amount }
    )
    end
end  
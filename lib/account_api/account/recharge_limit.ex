defmodule AccountApi.Account.RechargeLimit do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]

  alias AccountApi.Account.RechargeLimit
  alias AccountApi.Repo
  
  @primary_key {:id, :binary_id, autogenerate: true}

  schema "recharge_limit" do
    field :account_id, :binary_id
    field :start_at, :naive_datetime
    field :end_at, :naive_datetime
    field :amount, :decimal, precision: 18, scale: 2
    field :is_active, :boolean

    timestamps()
  end

  @required_fields ~w(amount account_id)
  @optional_fields ~w()
  @doc """
  Creates a changeset based on the `model` and `params`.
  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def create_changeset(%RechargeLimit{} = recharge_limit, attrs) do
    recharge_limit
    |> cast(attrs, @required_fields, @optional_fields)
  end
  def create_limit(attrs) do
    %RechargeLimit{}
    |> RechargeLimit.create_changeset(attrs)
    |> Repo.insert()
  end

  def list_recharge_limits do
    Repo.all(
        from c in RechargeLimit,
        where: c.is_active == true,
        select: %{id: c.id, account_id: c.account_id, start_at: c.start_at, amount: c.amount }
    )
  end
end

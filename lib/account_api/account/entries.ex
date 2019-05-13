defmodule AccountApi.Account.Entries do
    use Ecto.Schema
    import Ecto.Changeset
    alias AccountApi.Account.RechargeLimit
    import Ecto.Query, only: [from: 2]
    
    @primary_key {:id, :binary_id, autogenerate: true}
    @valid_entry_types [0, 1]
    
    schema "entries" do
        field :entry_code, :string, size: 125
        field :date_entry, :naive_datetime
        field :account_id, :binary_id
        field :amount, :decimal, precision: 18, scale: 2
        field :balance, :decimal, precision: 18, scale: 2
        field :description, :string, size: 225
        field :entry_type, :integer
        field :entry_mode, :integer
        field :limit, :decimal, precision: 18, scale: 2
        field :limit_used, :decimal, precision: 18, scale: 2
        field :limit_remaining, :decimal, precision: 18, scale: 2
        field :limit_over, :decimal, precision: 18, scale: 2
  
        timestamps()

        has_many :recharge_limit , {"recharge_limit", RechargeLimit}
    end
  
    @required_fields ~w(amount company_id balance)
    @optional_fields ~w()
    @doc """
    Creates a changeset based on the `model` and `params`.
    If `params` are nil, an invalid changeset is returned
    with no validation performed.
    """
    def changeset(model, params \\ nil) do
      model
      |> cast(params, @required_fields, @optional_fields)
      |> validate_inclusion(:entry_type, @valid_entry_types)
    end
  end
  
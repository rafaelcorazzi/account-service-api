defmodule AccountApi.Account.RechargeLimit do
  use Ecto.Schema
  import Ecto.Changeset
  @primary_key {:id, :binary_id, autogenerate: true}

  schema "recharge_limit" do
    field :company_id, :integer, size: 9, null: false
    field :start_at, :utc_datetime
    field :end_at, :utc_datetime


  end

  @required_fields ~w(body word_count)
  @optional_fields ~w()
  @doc """
  Creates a changeset based on the `model` and `params`.
  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ nil) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end

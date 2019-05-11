defmodule AccountApi.Repo.Migrations.AddRechargeLimitTable do
  use Ecto.Migration

  def change do
    create table("recharge_limit", primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("uuid_generate_v4()")
      add :company_id, :integer
      add :start_at, :datetime
      add :end_at, :datetime
      add :amount, :decimal, precision: 18, scale: 2
      add :is_active, :boolean, default: true, null: false

      timestamps()
    end
  end
end

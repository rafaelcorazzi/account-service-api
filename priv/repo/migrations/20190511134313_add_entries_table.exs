defmodule AccountApi.Repo.Migrations.AddEntriesTable do
  use Ecto.Migration

  def change do
    create table("entries", primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("uuid_generate_v4()")
      add :entry_code, :string, size: 125
      add :date_entry, :datetime
      add :company_id, :integer
      add :amount, :decimal, precision: 18, scale: 2
      add :description, :string, size: 225
      add :entry_type, :integer
      add :entry_mode, :integer
      add :balance, :decimal, precision: 18, scale: 2
      add :limit, :decimal, precision: 18, scale: 2
      add :limit_used, :decimal, precision: 18, scale: 2
      add :limit_remaining, :decimal, precision: 18, scale: 2
      add :limit_over, :decimal, precision: 18, scale: 2
      
      timestamps()
    end
  end
end

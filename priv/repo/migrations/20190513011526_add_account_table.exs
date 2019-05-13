defmodule AccountApi.Repo.Migrations.AddAccountTable do
  use Ecto.Migration

  def change do
    create table("account", primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("uuid_generate_v4()")
      add :opened_at, :datetime
      add :end_at, :datetime
      add :account_name, :string, size: 256
      add :document , :string, size: 14
      add :is_company, :boolean, null: false
      add :is_active, :boolean, default: true, null: false

      timestamps()
    end
  end
end

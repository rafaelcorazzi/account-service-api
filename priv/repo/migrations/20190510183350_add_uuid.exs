defmodule AccountApi.Repo.Migrations.AddUuid do
  use Ecto.Migration

  def up do
    execute "create extension if not exists \"uuid-ossp\" with schema public"
  end

  def down do
    execute "drop extension \"uuid-ossp\""
  end
end

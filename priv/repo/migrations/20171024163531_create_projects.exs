defmodule GuardianAuth.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :title, :string
      add :active, :boolean, default: false, null: false

      timestamps()
    end

  end
end

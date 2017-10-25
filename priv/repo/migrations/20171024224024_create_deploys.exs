defmodule GuardianAuth.Repo.Migrations.CreateDeploys do
  use Ecto.Migration

  def change do
    create table(:deploys) do
      add :title, :string
      add :active, :boolean, default: false, null: false
      add :project_id, :integer

      timestamps()
    end

  end
end

defmodule GuardianAuth.Repo.Migrations.AddStatusToDeploy do
  use Ecto.Migration

  def change do
    alter table(:deploys) do
      add :status, :text, default: ""
    end
  end
end

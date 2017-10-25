defmodule GuardianAuth.Accounts.Deploy do
  use Ecto.Schema
  import Ecto.Changeset
  alias GuardianAuth.Accounts.Deploy


  schema "deploys" do
    field :active, :boolean, default: false
    field :project_id, :integer
    field :title, :string
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(%Deploy{} = deploy, attrs) do
    deploy
    |> cast(attrs, [:title, :active, :project_id, :status])
    |> validate_required([:project_id])
  end
end

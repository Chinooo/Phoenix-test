defmodule GuardianAuth.Accounts.Project do
  use Ecto.Schema
  import Ecto.Changeset
  alias GuardianAuth.Accounts.Project


  schema "projects" do
    field :active, :boolean, default: false
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(%Project{} = project, attrs) do
    project
    |> cast(attrs, [:title, :active])
    |> validate_required([:title, :active])
  end
end

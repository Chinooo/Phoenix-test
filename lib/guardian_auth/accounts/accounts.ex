defmodule GuardianAuth.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias GuardianAuth.Repo

  alias GuardianAuth.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias GuardianAuth.Accounts.Project

  @doc """
  Returns the list of projects.

  ## Examples

      iex> list_projects()
      [%Project{}, ...]

  """
  def list_projects do
    Repo.all(Project)
  end

  @doc """
  Gets a single project.

  Raises `Ecto.NoResultsError` if the Project does not exist.

  ## Examples

      iex> get_project!(123)
      %Project{}

      iex> get_project!(456)
      ** (Ecto.NoResultsError)

  """
  def get_project!(id), do: Repo.get!(Project, id)

  @doc """
  Creates a project.

  ## Examples

      iex> create_project(%{field: value})
      {:ok, %Project{}}

      iex> create_project(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_project(attrs \\ %{}) do
    %Project{}
    |> Project.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a project.

  ## Examples

      iex> update_project(project, %{field: new_value})
      {:ok, %Project{}}

      iex> update_project(project, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_project(%Project{} = project, attrs) do
    project
    |> Project.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Project.

  ## Examples

      iex> delete_project(project)
      {:ok, %Project{}}

      iex> delete_project(project)
      {:error, %Ecto.Changeset{}}

  """
  def delete_project(%Project{} = project) do
    Repo.delete(project)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking project changes.

  ## Examples

      iex> change_project(project)
      %Ecto.Changeset{source: %Project{}}

  """
  def change_project(%Project{} = project) do
    Project.changeset(project, %{})
  end

  alias GuardianAuth.Accounts.Deploy

  @doc """
  Returns the list of deploys.

  ## Examples

      iex> list_deploys()
      [%Deploy{}, ...]

  """
  def list_deploys do
    Repo.all(Deploy)
  end

  @doc """
  Gets a single deploy.

  Raises `Ecto.NoResultsError` if the Deploy does not exist.

  ## Examples

      iex> get_deploy!(123)
      %Deploy{}

      iex> get_deploy!(456)
      ** (Ecto.NoResultsError)

  """
  def get_deploy!(id), do: Repo.get!(Deploy, id)
  def get_deploy_by_project!(project), do: Repo.get_by!(Deploy, project_id: project.id)

  @doc """
  Creates a deploy.

  ## Examples

      iex> create_deploy(%{field: value})
      {:ok, %Deploy{}}

      iex> create_deploy(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_deploy(attrs \\ %{}) do
    %Deploy{}
    |> Deploy.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a deploy.

  ## Examples

      iex> update_deploy(deploy, %{field: new_value})
      {:ok, %Deploy{}}

      iex> update_deploy(deploy, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_deploy(%Deploy{} = deploy, attrs) do
    deploy
    |> Deploy.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Deploy.

  ## Examples

      iex> delete_deploy(deploy)
      {:ok, %Deploy{}}

      iex> delete_deploy(deploy)
      {:error, %Ecto.Changeset{}}

  """
  def delete_deploy(%Deploy{} = deploy) do
    Repo.delete(deploy)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking deploy changes.

  ## Examples

      iex> change_deploy(deploy)
      %Ecto.Changeset{source: %Deploy{}}

  """
  def change_deploy(%Deploy{} = deploy) do
    Deploy.changeset(deploy, %{})
  end
end

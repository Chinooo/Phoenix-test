defmodule GuardianAuth.AccountsTest do
  use GuardianAuth.DataCase

  alias GuardianAuth.Accounts

  describe "users" do
    alias GuardianAuth.Accounts.User

    @valid_attrs %{email: "some email", password_hash: "some password_hash"}
    @update_attrs %{email: "some updated email", password_hash: "some updated password_hash"}
    @invalid_attrs %{email: nil, password_hash: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.password_hash == "some password_hash"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.email == "some updated email"
      assert user.password_hash == "some updated password_hash"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "projects" do
    alias GuardianAuth.Accounts.Project

    @valid_attrs %{active: true, title: "some title"}
    @update_attrs %{active: false, title: "some updated title"}
    @invalid_attrs %{active: nil, title: nil}

    def project_fixture(attrs \\ %{}) do
      {:ok, project} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_project()

      project
    end

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Accounts.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Accounts.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      assert {:ok, %Project{} = project} = Accounts.create_project(@valid_attrs)
      assert project.active == true
      assert project.title == "some title"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      assert {:ok, project} = Accounts.update_project(project, @update_attrs)
      assert %Project{} = project
      assert project.active == false
      assert project.title == "some updated title"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_project(project, @invalid_attrs)
      assert project == Accounts.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Accounts.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Accounts.change_project(project)
    end
  end

  describe "deploys" do
    alias GuardianAuth.Accounts.Deploy

    @valid_attrs %{active: true, title: "some title"}
    @update_attrs %{active: false, title: "some updated title"}
    @invalid_attrs %{active: nil, title: nil}

    def deploy_fixture(attrs \\ %{}) do
      {:ok, deploy} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_deploy()

      deploy
    end

    test "list_deploys/0 returns all deploys" do
      deploy = deploy_fixture()
      assert Accounts.list_deploys() == [deploy]
    end

    test "get_deploy!/1 returns the deploy with given id" do
      deploy = deploy_fixture()
      assert Accounts.get_deploy!(deploy.id) == deploy
    end

    test "create_deploy/1 with valid data creates a deploy" do
      assert {:ok, %Deploy{} = deploy} = Accounts.create_deploy(@valid_attrs)
      assert deploy.active == true
      assert deploy.title == "some title"
    end

    test "create_deploy/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_deploy(@invalid_attrs)
    end

    test "update_deploy/2 with valid data updates the deploy" do
      deploy = deploy_fixture()
      assert {:ok, deploy} = Accounts.update_deploy(deploy, @update_attrs)
      assert %Deploy{} = deploy
      assert deploy.active == false
      assert deploy.title == "some updated title"
    end

    test "update_deploy/2 with invalid data returns error changeset" do
      deploy = deploy_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_deploy(deploy, @invalid_attrs)
      assert deploy == Accounts.get_deploy!(deploy.id)
    end

    test "delete_deploy/1 deletes the deploy" do
      deploy = deploy_fixture()
      assert {:ok, %Deploy{}} = Accounts.delete_deploy(deploy)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_deploy!(deploy.id) end
    end

    test "change_deploy/1 returns a deploy changeset" do
      deploy = deploy_fixture()
      assert %Ecto.Changeset{} = Accounts.change_deploy(deploy)
    end
  end

  describe "deploys" do
    alias GuardianAuth.Accounts.Deploy

    @valid_attrs %{active: true, project_id: 42, title: "some title"}
    @update_attrs %{active: false, project_id: 43, title: "some updated title"}
    @invalid_attrs %{active: nil, project_id: nil, title: nil}

    def deploy_fixture(attrs \\ %{}) do
      {:ok, deploy} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_deploy()

      deploy
    end

    test "list_deploys/0 returns all deploys" do
      deploy = deploy_fixture()
      assert Accounts.list_deploys() == [deploy]
    end

    test "get_deploy!/1 returns the deploy with given id" do
      deploy = deploy_fixture()
      assert Accounts.get_deploy!(deploy.id) == deploy
    end

    test "create_deploy/1 with valid data creates a deploy" do
      assert {:ok, %Deploy{} = deploy} = Accounts.create_deploy(@valid_attrs)
      assert deploy.active == true
      assert deploy.project_id == 42
      assert deploy.title == "some title"
    end

    test "create_deploy/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_deploy(@invalid_attrs)
    end

    test "update_deploy/2 with valid data updates the deploy" do
      deploy = deploy_fixture()
      assert {:ok, deploy} = Accounts.update_deploy(deploy, @update_attrs)
      assert %Deploy{} = deploy
      assert deploy.active == false
      assert deploy.project_id == 43
      assert deploy.title == "some updated title"
    end

    test "update_deploy/2 with invalid data returns error changeset" do
      deploy = deploy_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_deploy(deploy, @invalid_attrs)
      assert deploy == Accounts.get_deploy!(deploy.id)
    end

    test "delete_deploy/1 deletes the deploy" do
      deploy = deploy_fixture()
      assert {:ok, %Deploy{}} = Accounts.delete_deploy(deploy)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_deploy!(deploy.id) end
    end

    test "change_deploy/1 returns a deploy changeset" do
      deploy = deploy_fixture()
      assert %Ecto.Changeset{} = Accounts.change_deploy(deploy)
    end
  end
end

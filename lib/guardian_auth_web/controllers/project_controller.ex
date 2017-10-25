defmodule GuardianAuthWeb.ProjectController do
  use GuardianAuthWeb, :controller

  alias GuardianAuth.Accounts
  alias GuardianAuth.Accounts.Project

  action_fallback GuardianAuthWeb.FallbackController

  def index(conn, _params) do
    projects = Accounts.list_projects()
    render(conn, "index.json", projects: projects)
  end

#  def create(conn ,params) do
#	IO.inspect params
#    with {:ok, %Project{} = project} <- Accounts.create_project(params) do
#      conn
#      |> put_status(:created)
#      |> put_resp_header("location", project_path(conn, :show, project))
#      |> render("show.json", project: project)
#    end
#  end

  def create(conn, %{"project" => project_params}) do
      with {:ok, %Project{} = project} <- Accounts.create_project(project_params) do
        res = Accounts.create_deploy(%{"project_id" => project.id, "title" => "This is a title"})
        IO.inspect res
      conn
      |> put_status(:created)
      |> put_resp_header("location", project_path(conn, :show, project))
      |> render("show.json", project: project)
    end
  end

  def show(conn, %{"id" => id}) do
    project = Accounts.get_project!(id)
    render(conn, "show.json", project: project)
  end

  def update(conn, %{"id" => id, "project" => project_params}) do
    project = Accounts.get_project!(id)

    with {:ok, %Project{} = project} <- Accounts.update_project(project, project_params) do
      render(conn, "show.json", project: project)
    end
  end

  def delete(conn, %{"id" => id}) do
    project = Accounts.get_project!(id)
    with {:ok, %Project{}} <- Accounts.delete_project(project) do
      send_resp(conn, :no_content, "")
    end
  end
end

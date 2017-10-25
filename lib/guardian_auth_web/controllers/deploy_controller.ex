defmodule GuardianAuthWeb.DeployController do
  use GuardianAuthWeb, :controller

  alias GuardianAuth.Accounts
  alias GuardianAuth.Accounts.Deploy
  alias GuardianAuthWeb.Accounts.Project

  action_fallback GuardianAuthWeb.FallbackController

 # def index(conn, _params) do
#    deploys = Accounts.list_deploys()
#    render(conn, "index.json", deploys: deploys)
#  end

  def create(conn, %{"deploy" => deploy_params}) do
    with {:ok, %Deploy{} = deploy} <- Accounts.create_deploy(deploy_params) do
      conn
      |> put_status(:created)
      #|> put_resp_header("location", deploy_path(conn, :show, deploy))
      |> render("show.json", deploy: deploy)
    end
  end

  def index(conn, %{"project_id" => project_id }) do
    project = Accounts.get_project!(project_id)
    deploy = Accounts.get_deploy_by_project!(project)
    render(conn, "show.json", deploy: deploy)
  end
#terraform status
  def update(conn, %{"status" => "plan", "project_id" => project_id}) do
    project = Accounts.get_project!(project_id)
    deploy = Accounts.get_deploy_by_project!(project)
     {res,_} = System.cmd "terraform", ["plan"]
#     deploy.title = res
    deploy_params = %{"status" => res}
    with {:ok, %Deploy{} = deploy} <- Accounts.update_deploy(deploy, deploy_params) do
      render(conn, "show.json", deploy: deploy)
    end
  end
#terraform apply
  def update(conn, %{"status" => "apply", "project_id" => project_id}) do
    project = Accounts.get_project!(project_id)
    deploy = Accounts.get_deploy_by_project!(project)
    {res,_} = System.cmd "terraform", ["apply"]
    deploy_params = %{"status" => res}

    with {:ok, %Deploy{} = deploy} <- Accounts.update_deploy(deploy, deploy_params) do
      render(conn, "show.json", deploy: deploy)
    end
  end
#terraform destroy
  def update(conn, %{"status" => "destroy", "project_id" => project_id}) do
    project = Accounts.get_project!(project_id)
    deploy = Accounts.get_deploy_by_project!(project)
    {res,_} = System.cmd "bash", ["destroy.sh"]
    deploy_params = %{"status" => res}

    with {:ok, %Deploy{} = deploy} <- Accounts.update_deploy(deploy, deploy_params) do
      render(conn, "show.json", deploy: deploy)
    end
  end

  def delete(conn, %{"id" => id}) do
    deploy = Accounts.get_deploy!(id)
    with {:ok, %Deploy{}} <- Accounts.delete_deploy(deploy) do
      send_resp(conn, :no_content, "")
    end
  end
end

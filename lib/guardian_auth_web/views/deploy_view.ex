defmodule GuardianAuthWeb.DeployView do
  use GuardianAuthWeb, :view
  alias GuardianAuthWeb.DeployView

  def render("index.json", %{deploys: deploys}) do
    %{data: render_many(deploys, DeployView, "deploy.json")}
  end

  def render("show.json", %{deploy: deploy}) do
    %{data: render_one(deploy, DeployView, "deploy.json")}
  end

  def render("deploy.json", %{deploy: deploy}) do
    %{id: deploy.id,
      title: deploy.title,
      active: deploy.active,
      project_id: deploy.project_id,
      status: deploy.status}
  end
end

defmodule GuardianAuthWeb.DeployControllerTest do
  use GuardianAuthWeb.ConnCase

  alias GuardianAuth.Accounts
  alias GuardianAuth.Accounts.Deploy

  @create_attrs %{active: true, project_id: 42, title: "some title"}
  @update_attrs %{active: false, project_id: 43, title: "some updated title"}
  @invalid_attrs %{active: nil, project_id: nil, title: nil}

  def fixture(:deploy) do
    {:ok, deploy} = Accounts.create_deploy(@create_attrs)
    deploy
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all deploys", %{conn: conn} do
      conn = get conn, deploy_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create deploy" do
    test "renders deploy when data is valid", %{conn: conn} do
      conn = post conn, deploy_path(conn, :create), deploy: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, deploy_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "active" => true,
        "project_id" => 42,
        "title" => "some title"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, deploy_path(conn, :create), deploy: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update deploy" do
    setup [:create_deploy]

    test "renders deploy when data is valid", %{conn: conn, deploy: %Deploy{id: id} = deploy} do
      conn = put conn, deploy_path(conn, :update, deploy), deploy: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, deploy_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "active" => false,
        "project_id" => 43,
        "title" => "some updated title"}
    end

    test "renders errors when data is invalid", %{conn: conn, deploy: deploy} do
      conn = put conn, deploy_path(conn, :update, deploy), deploy: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete deploy" do
    setup [:create_deploy]

    test "deletes chosen deploy", %{conn: conn, deploy: deploy} do
      conn = delete conn, deploy_path(conn, :delete, deploy)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, deploy_path(conn, :show, deploy)
      end
    end
  end

  defp create_deploy(_) do
    deploy = fixture(:deploy)
    {:ok, deploy: deploy}
  end
end

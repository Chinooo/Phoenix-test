defmodule GuardianAuthWeb.SessionController do
  use GuardianAuthWeb, :controller

  def new(conn, _) do
    if GuardianAuth.Session.logged_in?(conn), do: redirect(conn,to: "/"), else: render(conn,"new.html")
  end

  def create(conn, %{"session" => %{"email" => user,
    "password" => pass}}) do
    IO.inspect user, label: "============THIS IS EMAIL================"
    case GuardianAuth.Auth.login_by_email_and_pass(conn, user, pass, repo: GuardianAuth.Repo) do
      {:ok, conn} ->
        user = Guardian.Plug.current_resource(conn)
        jwt = Guardian.Plug.current_token(conn)
        {:ok, claims} = Guardian.Plug.claims(conn)
        exp = Map.get(claims, "exp")
        conn
        |> put_status(:created)
        |> put_resp_header("authorization", "Bearer #{jwt}")
        |> put_resp_header("x-expires", "#{exp}")
        |> json(%{user_session: %{id: user.id, email: user.email,
                  token: jwt, exp: exp}})

      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Wrong username/password")
        |> render("new.html")
    end
  end

  def delete(conn, _) do conn
    |> Guardian.Plug.sign_out
    |> put_flash(:info, "Your session is end ")
    |> redirect(to: "/")
  end
end

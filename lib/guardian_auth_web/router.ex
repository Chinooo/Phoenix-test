defmodule GuardianAuthWeb.Router do
  use GuardianAuthWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :browser_auth do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.VerifyHeader
    plug Guardian.Plug.LoadResource
  end

  pipeline :ensure_authed_access do
    plug Guardian.Plug.EnsureAuthenticated,handler: GuardianAuth.HttpErrorHandler
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  scope "/", GuardianAuthWeb do
       pipe_through [:api] # Use the default browser stack

       resources "/users", UserController, except: [:new, :edit, :show, :index]
       resources "/sessions", SessionController, only: [:new, :create,:delete]
       #       get "/", PageController, :index
  end

  scope "/", GuardianAuthWeb do
       pipe_through [:api, :ensure_authed_access] # Use the default browser stack

       resources "/users", UserController, except: [:new, :edit]
       resources "/sessions", SessionController, only: [:new, :create,:delete]
       #       get "/", PageController, :index
  end

    scope "/", GuardianAuthWeb do
      pipe_through [:browser]
      #resources "/sessions", SessionController, only: [:new, :create,:delete  ]
      #resources "/users", UserController, only: [:new,:create]

    end
  #
  #
  #  scope "/", GuardianAuthWeb do
  #    pipe_through [:browser]
  #    get "/", PageController, :index
  #    resources "/users", UserController, only: [:show, :index, :update,:edit,:delete]
  #  end

end

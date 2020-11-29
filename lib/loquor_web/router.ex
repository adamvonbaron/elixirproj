defmodule LoquorWeb.Router do
  use LoquorWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :verify_auth do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated, %{
      "typ" => "access",
      handlder: Loquor.HttpErrorHandler
    }
  end

  pipeline :graphql do
    plug LoquorWeb.Context
  end

  scope "/api", LoquorWeb do
    pipe_through [:verify_auth, :api]

    post "/login", LoquorWeb.AuthController, :login
    post "/logout", LoquorWeb.AuthController, :logout
  end

  scope "/graphql", LoquorWeb do
    pipe_through [:verify_auth, :ensure_auth, :graphql]

    forward "/", Absinthe.Plug, schema: LoquorWeb.Schema
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: LoquorWeb.Telemetry
    end

    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: LoquorWeb.Schema
  end
end

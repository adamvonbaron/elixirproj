defmodule LoquorWeb.Router do
  use LoquorWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :check_auth do
    plug Loquor.Guardian.Pipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated, claims: %{"typ" => "access"}
  end

  pipeline :graphql do
    # plug LoquorWeb.GraphQLContext

    plug Plug.Parsers,
      parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
      pass: ["*/*"],
      json_decoder: Jason
  end

  scope "/api", LoquorWeb do
    pipe_through [:api, :check_auth]

    post "/login", AuthController, :login
    post "/logout", AuthController, :logout
  end

  scope "/graphql" do
    pipe_through [:check_auth, :ensure_auth, :graphql]

    forward "/", Absinthe.Plug, schema: Loquor.Graphql.Schema
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

    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: Loquor.Graphql.Schema
  end
end

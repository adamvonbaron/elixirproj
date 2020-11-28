# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :loquor,
  ecto_repos: [Loquor.Repo]

# Configures the endpoint
config :loquor, LoquorWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "fPz31W3TMqCftkKAuH1ia+r+0nwF+RIwMmA4RNs5hYPTkfwTsamj82PPJuliMarL",
  render_errors: [view: LoquorWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Loquor.PubSub,
  live_view: [signing_salt: "a8zOMXR5"]

# use guardian for authentication
config :loquor, Loquor.Guardian,
  issuer: "loquor",
  secret_key: "lemonadewasapopulardrinkanditstillis"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

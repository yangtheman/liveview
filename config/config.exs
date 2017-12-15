# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :liveview,
  ecto_repos: [Liveview.Repo],
  google_maps_api_key: System.get_env("GOOGLE_MAPS_API_KEY")

# Configures the endpoint
config :liveview, Liveview.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "JenmsxfDgd61CN9qOp+yrj7jmZWQ2/IrbeKmzhGT1JhPdVmw3ir14ouo05pWIo0d",
  render_errors: [view: Liveview.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Liveview.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

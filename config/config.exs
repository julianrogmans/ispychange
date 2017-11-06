# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ispychange,
  ecto_repos: [Ispychange.Repo]

# Configures the endpoint
config :ispychange, IspychangeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "x+SnEhLyEIjA2edo8HItp3+nKprg3xnj/aigwxQuGW7BGeOQI49pXMKg40IOe8yZ",
  render_errors: [view: IspychangeWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Ispychange.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :quiero_saber,
  ecto_repos: [QuieroSaber.Repo]

# Configures the endpoint
config :quiero_saber, QuieroSaber.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "a5/y27wtmPPZ+r2s/l/K6UABNrBjEvkZ3AcQk96aka8p92ehJkmL21VgeIXYQNFb",
  render_errors: [view: QuieroSaber.ErrorView, accepts: ~w(html json)],
  pubsub: [name: QuieroSaber.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :account_api,
  ecto_repos: [AccountApi.Repo]

# Configures the endpoint
config :account_api, AccountApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XqTx4vXm//kzZyfUqvLIeK5cY+YB97dTEUVNFHQMng159vbQrwWW7A0nkt86mECl",
  render_errors: [view: AccountApi.ErrorView, accepts: ~w(json)],
  pubsub: [name: AccountApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
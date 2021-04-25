# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pento,
  ecto_repos: [Pento.Repo]

config :pento, Pento.Mailer,
  adapter: Bamboo.SendGridAdapter,
  api_key: "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",
  hackney_opts: [
    recv_timeout: :timer.minutes(1),
    connect_timeout: :timer.minutes(1)
  ]

# Configures the endpoint
config :pento, PentoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gV1wSEJU5GNG9fr18kDDNk6ImXsw05hriSEo5cz0NiWXGiASPqU9s9H82zkoGSHb",
  render_errors: [view: PentoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Pento.PubSub,
  live_view: [signing_salt: "iq7JKn6c"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

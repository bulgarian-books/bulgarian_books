# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :bulgarian_books,
  ecto_repos: [BulgarianBooks.Repo]

# Configures the endpoint
config :bulgarian_books, BulgarianBooksWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hbZOjPOqwQGfNKRL9bOhY4x7r+I3MJK+dN2fdW1ZbXj55nlsmrjHXCFWODdyyt2T",
  render_errors: [view: BulgarianBooksWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: BulgarianBooks.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

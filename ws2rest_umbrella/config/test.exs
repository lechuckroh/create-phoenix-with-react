import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ws2rest_web, Ws2restWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "2Dwe0Tf7hN+ew8vJt1l4dKzPXKJR8SGoAzMnlEj76H+cCov2q4jzivN6/ITlxbSA",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

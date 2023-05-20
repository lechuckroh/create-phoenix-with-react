import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :hello_web, HelloWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "U5Ark5V/pG27/H/EEcMXZ8Mw+sJXb0gy0yC/Lq/k1vN614duw/VYfh4mX+NjYjlD",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# In test we don't send emails.
config :hello, Hello.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

defmodule Ws2restWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      Ws2restWeb.Telemetry,
      # Start the Endpoint (http/https)
      Ws2restWeb.Endpoint
      # Start a worker by calling: Ws2restWeb.Worker.start_link(arg)
      # {Ws2restWeb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ws2restWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Ws2restWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

defmodule LibraryWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LibraryWeb.Telemetry,
      # Start the Endpoint (http/https)
      LibraryWeb.Endpoint
      # Start a worker by calling: LibraryWeb.Worker.start_link(arg)
      # {LibraryWeb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LibraryWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LibraryWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

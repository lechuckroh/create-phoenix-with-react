defmodule Ws2rest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the PubSub system
      {Phoenix.PubSub, name: Ws2rest.PubSub}
      # Start a worker by calling: Ws2rest.Worker.start_link(arg)
      # {Ws2rest.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Ws2rest.Supervisor)
  end
end

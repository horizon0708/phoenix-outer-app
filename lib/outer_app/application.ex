defmodule OuterApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      OuterAppWeb.Telemetry,
      # Start the Ecto repository
      OuterApp.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: OuterApp.PubSub},
      # Start Finch
      {Finch, name: OuterApp.Finch},
      # Start the Endpoint (http/https)
      OuterAppWeb.Endpoint
      # Start a worker by calling: OuterApp.Worker.start_link(arg)
      # {OuterApp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: OuterApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    OuterAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

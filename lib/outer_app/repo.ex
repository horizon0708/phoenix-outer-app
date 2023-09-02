defmodule OuterApp.Repo do
  use Ecto.Repo,
    otp_app: :outer_app,
    adapter: Ecto.Adapters.Postgres
end

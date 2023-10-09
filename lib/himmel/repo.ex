defmodule Himmel.Repo do
  use Ecto.Repo,
    otp_app: :himmel,
    adapter: Ecto.Adapters.Postgres
end

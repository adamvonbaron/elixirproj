defmodule Loquor.Repo do
  use Ecto.Repo,
    otp_app: :loquor,
    adapter: Ecto.Adapters.Postgres
end

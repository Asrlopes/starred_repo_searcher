defmodule Brainn.Repo do
  use Ecto.Repo,
    otp_app: :brainn,
    adapter: Ecto.Adapters.Postgres
end

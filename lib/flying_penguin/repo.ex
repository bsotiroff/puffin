defmodule FlyingPenguin.Repo do
  use Ecto.Repo,
    otp_app: :flying_penguin,
    adapter: Ecto.Adapters.Postgres
end

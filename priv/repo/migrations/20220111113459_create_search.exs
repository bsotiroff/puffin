defmodule FlyingPenguin.Repo.Migrations.CreateSearch do
  use Ecto.Migration

  def change do
    create table(:search) do
      add :origin, :string
      add :destination, :string
      add :date_of_departure, :date
      add :date_of_return, :date
      add :seat_class, :string
      add :number_of_adults, :integer

      timestamps()
    end
  end
end

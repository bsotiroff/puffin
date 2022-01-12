defmodule FlyingPenguin.Flight.Search do
  use Ecto.Schema
  import Ecto.Changeset

  schema "search" do
    field :date_of_departure, :date
    field :date_of_return, :date
    field :destination, :string
    field :number_of_adults, :integer
    field :origin, :string
    field :seat_class, :string

    timestamps()
  end

  @spec changeset(
          {map, map}
          | %{
              :__struct__ => atom | %{:__changeset__ => map, optional(any) => any},
              optional(atom) => any
            },
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(search, attrs) do
    search
    |> cast(attrs, [:origin, :destination, :date_of_departure, :date_of_return, :seat_class, :number_of_adults])
    |> validate_required([:origin, :destination, :date_of_departure, :date_of_return, :seat_class, :number_of_adults])
  end
end

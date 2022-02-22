defmodule FlyingPenguin.Duffel.Offer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "duffel_offer" do
    field :base_amount, :string
    field :base_currency, :string
    field :carrier, :string
    field :departing_at, :utc_datetime
    field :arriving_at, :utc_datetime
    field :number_of_stops, :integer
    belongs_to :duffel_response, FlyingPenguin.Duffel.Response
    timestamps()
  end

  @doc false
  def changeset(offer, attrs) do
    offer
    |> cast(attrs, [:base_amount, :base_currency, :carrier, :departing_at, :arriving_at, :number_of_stops])
    |> validate_required([:base_amount, :base_currency, :carrier, :departing_at, :arriving_at, :number_of_stops])
  end
end

defmodule FlyingPenguin.Duffel.Offer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "duffel_offer" do
    field :base_amount, :string
    field :base_currency, :string
    field :carrier, :string
    belongs_to :duffel_response, FlyingPenguin.Duffel.Response
    timestamps()
  end

  @doc false
  def changeset(offer, attrs) do
    offer
    |> cast(attrs, [:base_amount, :base_currency, :carrier])
    |> validate_required([:base_amount, :base_currency, :carrier])
  end
end

defmodule FlyingPenguin.Duffel.Response do
  use Ecto.Schema
  import Ecto.Changeset

  schema "duffel_response" do
    field :cabin_class, :string
    has_many :duffel_offers, FlyingPenguin.Duffel.Offer
    timestamps()
  end

  @doc false
  def changeset(response, attrs) do
    response
    |> cast(attrs, [:cabin_class])
    |> validate_required([:cabin_class])
  end
end

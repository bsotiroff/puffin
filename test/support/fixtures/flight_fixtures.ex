defmodule FlyingPenguin.FlightFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FlyingPenguin.Flight` context.
  """

  @doc """
  Generate a search.
  """
  def search_fixture(attrs \\ %{}) do
    {:ok, search} =
      attrs
      |> Enum.into(%{
        date_of_departure: ~D[2022-01-10],
        date_of_return: ~D[2022-01-10],
        destination: "some destination",
        number_of_adults: 42,
        origin: "some origin",
        seat_class: "some seat_class"
      })
      |> FlyingPenguin.Flight.create_search()

    search
  end
end

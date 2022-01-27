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
        date_of_departure: ~D[2023-01-10],
        date_of_return: ~D[2023-01-10],
        destination: "BKK",
        number_of_adults: 42,
        origin: "ORD",
        seat_class: "economy"
      })
      |> FlyingPenguin.Flight.create_search()

    search
  end
end

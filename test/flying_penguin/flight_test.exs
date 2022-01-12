defmodule FlyingPenguin.FlightTest do
  use FlyingPenguin.DataCase

  alias FlyingPenguin.Flight

  describe "search" do
    alias FlyingPenguin.Flight.Search

    import FlyingPenguin.FlightFixtures

    @invalid_attrs %{date_of_departure: nil, date_of_return: nil, destination: nil, number_of_adults: nil, origin: nil, seat_class: nil}

    test "list_search/0 returns all search" do
      search = search_fixture()
      assert Flight.list_search() == [search]
    end

    test "get_search!/1 returns the search with given id" do
      search = search_fixture()
      assert Flight.get_search!(search.id) == search
    end

    test "create_search/1 with valid data creates a search" do
      valid_attrs = %{date_of_departure: ~D[2022-01-10], date_of_return: ~D[2022-01-10], destination: "some destination", number_of_adults: 42, origin: "some origin", seat_class: "some seat_class"}

      assert {:ok, %Search{} = search} = Flight.create_search(valid_attrs)
      assert search.date_of_departure == ~D[2022-01-10]
      assert search.date_of_return == ~D[2022-01-10]
      assert search.destination == "some destination"
      assert search.number_of_adults == 42
      assert search.origin == "some origin"
      assert search.seat_class == "some seat_class"
    end

    test "create_search/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Flight.create_search(@invalid_attrs)
    end

    test "update_search/2 with valid data updates the search" do
      search = search_fixture()
      update_attrs = %{date_of_departure: ~D[2022-01-11], date_of_return: ~D[2022-01-11], destination: "some updated destination", number_of_adults: 43, origin: "some updated origin", seat_class: "some updated seat_class"}

      assert {:ok, %Search{} = search} = Flight.update_search(search, update_attrs)
      assert search.date_of_departure == ~D[2022-01-11]
      assert search.date_of_return == ~D[2022-01-11]
      assert search.destination == "some updated destination"
      assert search.number_of_adults == 43
      assert search.origin == "some updated origin"
      assert search.seat_class == "some updated seat_class"
    end

    test "update_search/2 with invalid data returns error changeset" do
      search = search_fixture()
      assert {:error, %Ecto.Changeset{}} = Flight.update_search(search, @invalid_attrs)
      assert search == Flight.get_search!(search.id)
    end

    test "delete_search/1 deletes the search" do
      search = search_fixture()
      assert {:ok, %Search{}} = Flight.delete_search(search)
      assert_raise Ecto.NoResultsError, fn -> Flight.get_search!(search.id) end
    end

    test "change_search/1 returns a search changeset" do
      search = search_fixture()
      assert %Ecto.Changeset{} = Flight.change_search(search)
    end
  end
end

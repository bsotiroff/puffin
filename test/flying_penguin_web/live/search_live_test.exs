defmodule FlyingPenguinWeb.SearchLiveTest do
  use FlyingPenguinWeb.ConnCase

  import Phoenix.LiveViewTest
  import FlyingPenguin.FlightFixtures

  @create_attrs %{
    date_of_departure: %{day: 10, month: 1, year: 2023},
    date_of_return: %{day: 10, month: 1, year: 2023},
    destination: "ORD",
    number_of_adults: 2,
    origin: "BKK",
    seat_class: "economy"
  }
  @update_attrs %{
    date_of_departure: %{day: 11, month: 1, year: 2023},
    date_of_return: %{day: 11, month: 1, year: 2023},
    destination: "YVR",
    number_of_adults: 5,
    origin: "MDW",
    seat_class: "business"
  }
  @invalid_attrs %{
    date_of_departure: %{day: 30, month: 2, year: 2022},
    date_of_return: %{day: 30, month: 2, year: 2022},
    destination: "sunny beach",
    number_of_adults: nil,
    origin: "airport",
    seat_class: "first"
  }

  defp create_search(_) do
    search = search_fixture()
    %{search: search}
  end

  describe "Index" do
    setup [:create_search]

    test "lists all search", %{conn: conn, search: search} do
      {:ok, _index_live, html} = live(conn, Routes.search_index_path(conn, :index))

      assert html =~ "Listing Search"
      assert html =~ search.destination
    end

    test "saves new search", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.search_index_path(conn, :index))

      assert index_live |> element("a", "New Search") |> render_click() =~
               "New Search"

      assert_patch(index_live, Routes.search_index_path(conn, :new))

      assert index_live
             |> form("#search-form", search: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        index_live
        |> form("#search-form", search: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.search_index_path(conn, :index))

      assert html =~ "Search created successfully"
      assert html =~ "ORD"
    end

    test "updates search in listing", %{conn: conn, search: search} do
      {:ok, index_live, _html} = live(conn, Routes.search_index_path(conn, :index))

      assert index_live |> element("#search-#{search.id} a", "Edit") |> render_click() =~
               "Edit Search"

      assert_patch(index_live, Routes.search_index_path(conn, :edit, search))

      assert index_live
             |> form("#search-form", search: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        index_live
        |> form("#search-form", search: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.search_index_path(conn, :index))

      assert html =~ "Search updated successfully"
      assert html =~ "YVR"
    end

    test "deletes search in listing", %{conn: conn, search: search} do
      {:ok, index_live, _html} = live(conn, Routes.search_index_path(conn, :index))

      assert index_live |> element("#search-#{search.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#search-#{search.id}")
    end
  end

  describe "Show" do
    setup [:create_search]

    test "displays search", %{conn: conn, search: search} do
      {:ok, _show_live, html} = live(conn, Routes.search_show_path(conn, :show, search))

      assert html =~ "Show Search"
      assert html =~ search.destination
    end

    test "updates search within modal", %{conn: conn, search: search} do
      {:ok, show_live, _html} = live(conn, Routes.search_show_path(conn, :show, search))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Search"

      assert_patch(show_live, Routes.search_show_path(conn, :edit, search))

      assert show_live
             |> form("#search-form", search: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        show_live
        |> form("#search-form", search: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.search_show_path(conn, :show, search))

      assert html =~ "Search updated successfully"
      assert html =~ "YVR"
    end
  end
end

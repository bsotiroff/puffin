defmodule FlyingPenguinWeb.SearchLive.Index do
  use FlyingPenguinWeb, :live_view

  alias FlyingPenguin.Flight
  alias FlyingPenguin.Flight.Search

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :search_collection, list_search())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Search")
    |> assign(:search, Flight.get_search!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Search")
    |> assign(:search, %Search{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Search")
    |> assign(:search, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    search = Flight.get_search!(id)
    {:ok, _} = Flight.delete_search(search)

    {:noreply, assign(socket, :search_collection, list_search())}
  end

  defp list_search do
    Flight.list_search()
  end
end

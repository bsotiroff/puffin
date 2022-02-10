defmodule FlyingPenguinWeb.SearchLive.New do
  use FlyingPenguinWeb, :live_view

  alias FlyingPenguin.Flight
  alias FlyingPenguin.Flight.Search
  alias FlyingPenguin.Duffel.Client
  alias FlyingPenguin.Duffel.Response, as: DuffelResponse
  @impl true
  def mount(_params, _session, socket) do
    changeset = Flight.change_search(%Search{})
    {:ok, socket
          |> assign(%{ search: %Search{} })
          |> assign(%{ response: "response" })
          |> assign(live_action: :new)
          |> assign(page_title: "New Search")
          |> assign(title: "new")
          |> assign(changeset: changeset)
    }
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Search")
    |> assign(%{search: %Search{}})
  end

  @impl true
  def handle_event("validate", %{"search" => search_params}, socket) do
    changeset =
      socket.assigns.search
      |> Flight.change_search(search_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event("search", %{"search" => search_params}, socket) do
    IO.inspect search_params
    IO.inspect Client.get_offers(search_params)
    response = "search event happened"
    {:noreply, assign(socket, response: response)}
  end
end

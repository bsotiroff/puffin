defmodule FlyingPenguinWeb.SearchLive.FormComponent do
  use FlyingPenguinWeb, :live_component

  alias FlyingPenguin.Flight

  def mount(_params, _session, socket) do
    {:ok, assign(socket, date_of_departure: Date.utc_today(),
      date_of_return: Date.utc_today() |> Date.add(2),
      number_of_adults: 1)
    }
  end

  @impl true
  def update(%{search: search} = assigns, socket) do
    changeset = Flight.change_search(search)
    IO.inspect socket.assigns

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"search" => search_params}, socket) do
    changeset =
      socket.assigns.search
      |> Flight.change_search(search_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"search" => search_params}, socket) do
    save_search(socket, socket.assigns.action, search_params)
  end

  defp save_search(socket, :edit, search_params) do
    case Flight.update_search(socket.assigns.search, search_params) do
      {:ok, _search} ->
        {:noreply,
         socket
         |> put_flash(:info, "Search updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_search(socket, :new, search_params) do
    case Flight.create_search(search_params) do
      {:ok, _search} ->
        {:noreply,
         socket
         |> put_flash(:info, "Search created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end

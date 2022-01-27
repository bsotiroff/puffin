defmodule FlyingPenguinWeb.SearchLive.Show do
  use FlyingPenguinWeb, :live_view

  alias FlyingPenguin.Flight

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:search, Flight.get_search!(id))}
  end

  defp page_title(:show), do: "Show Search"
  defp page_title(:edit), do: "Edit Search"
end

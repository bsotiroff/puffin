defmodule FlyingPenguin.Duffel.Client do
  alias HTTPoison.Response
  alias HTTPoison.Error
  alias FlyingPenguin.Duffel.Request
  alias FlyingPenguin.Duffel.Response, as: DuffelResponse
  alias FlyingPenguin.Duffel.Offer, as: DuffelOffer

  def get_offers(search_params) do
    request_headers = [
      "Accept-Encoding": "gzip",
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Duffel-Version": "beta",
      "Authorization": "Bearer #{System.get_env("DUFFEL_TOKEN")}"
    ]

    case HTTPoison.post("https://api.duffel.com/air/offer_requests?return_offers=true", request_body(search_params), request_headers, [recv_timeout: 20000]) do
      {:ok, %Response{status_code: 200, body: body }} ->
        IO.puts body
      {:ok, %Response{status_code: 201, body: raw }} ->
        IO.puts "it was a 201!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        raw
        |> :zlib.gunzip
        |> Poison.decode(keys: :atoms)
      {:ok, %Response{status_code: 422, body: raw }} ->
        IO.puts "It Was a 422 :(((((((((((((((((((((((((((((((((((((((((("
        IO.puts raw
        |> :zlib.gunzip
        |> Poison.decode(keys: :atoms)
      {:ok, %Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %Error{reason: reason}} ->
        IO.inspect "there was an error"
        IO.inspect reason
    end
  end

  def parse_response(response) do
    IO.inspect(response[:id], label: "offer request id")
    %DuffelResponse{}
    |> Map.put(:cabin_class, response[:cabin_class])
    |> Map.put(:duffel_offers, parse_offers(response[:offers]))
  end

  defp parse_offers(offers) do
    Enum.map(offers, fn offer ->
      %DuffelOffer{}
      |> Map.put(:base_amount, offer[:base_amount])
      |> Map.put(:carrier, offer[:owner][:name])
      |> Map.put(:departing_at, get_first_departure_time(offer))
      |> Map.put(:arriving_at, get_final_arrival_time(offer))
      |> Map.put(:number_of_stops, get_stops(offer))
    end)
  end

  defp get_stops(offer) do
    # Enum.map(offer[:slices], fn slice ->
    #   IO.inspect(slice[:segments].length)
    # end)
    # Enum.reduce(offer.slices, fn slice, acc ->
    #   Enum.min(acc, slice.segments.length - 1)
    # end)
    [ slice | _] = offer.slices
    length(slice.segments) - 1
  end

  defp get_first_departure_time(offer) do
    [ slice | _] = offer.slices
    [segment | _] = slice.segments
    segment[:departing_at]
  end

  defp get_final_arrival_time(offer) do
    [ slice | _] = offer.slices
    [_ | segment] = slice.segments # this assumes that the segments are in chronological order. I'm not sure if that's the case
    segment[:arriving_at]
  end

  defp request_body(search_params) do
    build_request(search_params)
    |> wrap_request()
  end

  defp build_request(search_params) do
    slices = [
      %{
        origin: search_params["origin"],
        destination: search_params["destination"],
        departure_date: map_to_iso8601(search_params["date_of_departure"])
      },
      # %{
      #   origin: search_params["destination"],
      #   destination: search_params["origin"],
      #   departure_date: map_to_iso8601(search_params["date_of_return"])
      # }
    ]
    passengers = Enum.map(List.duplicate(:elem, String.to_integer(search_params["number_of_adults"])), fn _x -> %{ type: "adult" } end)
    %Request{}
    |> Map.put(:slices, slices)
    |> Map.put(:cabin_class, search_params["seat_class"])
    |> Map.put(:passengers, passengers)
  end

  defp wrap_request(request) do
    Poison.encode!(%{data: request})
  end

  defp map_to_iso8601(map) do
    with year <- String.to_integer(map["year"]),
         month <- String.to_integer(map["month"]),
         day <- String.to_integer(map["day"])
    do
      {:ok, date } = Date.from_erl({ year, month, day })
      Date.to_iso8601(date)
    end
  end
end

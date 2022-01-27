defmodule FlyingPenguin.Duffel.Client do
  alias HTTPoison.Response
  alias HTTPoison.Error
  alias FlyingPenguin.Duffel.Request

  # def request_body do
  #   Poison.encode!(%{
  #     data: %{
  #       slices: [
  #         %{
  #           origin: "NYC",
  #           destination: "ATL",
  #           departure_date: "2022-06-21"
  #         },
  #         %{
  #           origin: "ATL",
  #           destination: "NYC",
  #           departure_date: "2022-07-21"
  #         }
  #       ],
  #       passengers: [ %{ type: "adult" }, %{ type: "adult" }, %{ age: 1 }],
  #       cabin_class: "business"
  #     }
  #   })
  # end

  def get_offers(search_params) do
    request_headers = [
      "Accept-Encoding": "gzip",
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Duffel-Version": "beta",
      "Authorization": "Bearer #{System.get_env("DUFFEL_TOKEN")}"
    ]

    case HTTPoison.post("https://api.duffel.com/air/offer_requests", request_body(search_params), request_headers) do
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
        IO.inspect reason
    end
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
      %{
        origin: search_params["destination"],
        destination: search_params["origin"],
        departure_date: map_to_iso8601(search_params["date_of_return"])
      }
    ]
    passengers = Enum.map(1..String.to_integer(search_params["number_of_adults"]), fn _x -> %{ type: "adult" } end)
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

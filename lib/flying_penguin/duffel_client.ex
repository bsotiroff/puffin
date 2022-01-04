defmodule FlyingPenguin.DuffelClient do
  alias HTTPoison.Response
  alias HTTPoison.Error

  def request_body do
    Poison.encode!(%{
      data: %{
        slices: [
          %{
            origin: "NYC",
            destination: "ATL",
            departure_date: "2022-06-21"
          },
          %{
            origin: "ATL",
            destination: "NYC",
            departure_date: "2022-07-21"
          }
        ],
        passengers: [ %{ type: "adult" }, %{ type: "adult" }, %{ age: 1 }],
        cabin_class: "business"
      }
    })
  end

  def get_offers do
    request_headers = [
      "Accept-Encoding": "gzip",
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Duffel-Version": "beta",
      "Authorization": "Bearer duffel_test_nHrTAl5zgzFijhbPV0mj4gcXj8n2SjH98J9VlyW4R4G"
    ]
    case HTTPoison.post("https://api.duffel.com/air/offer_requests", request_body(), request_headers) do
      {:ok, %Response{status_code: 200, body: body }} ->
        IO.puts body
      {:ok, %Response{status_code: 201, body: raw }} ->
        raw
        |> :zlib.gunzip
        |> Poison.decode(keys: :atoms)
      {:ok, %Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %Error{reason: reason}} ->
        IO.inspect reason
    end
  end
end

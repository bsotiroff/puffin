defmodule FlyingPenguin.Duffel.Response do
  defstruct [:data]

#   {:ok,
#  %{
#    data: %{
#      cabin_class: "economy",
#      created_at: "2022-02-01T11:41:41.482267Z",
#      id: "orq_0000AG21PpycE6Z9PvnrEW",
#      live_mode: false,
#      offers: [
#        %{
#          allowed_passenger_identity_document_types: [],
#          base_amount: "444.91",
#          base_currency: "USD",
#          conditions: %{
#            change_before_departure: %{
#              allowed: false,
#              penalty_amount: nil,
#              penalty_currency: nil
#            },
#            refund_before_departure: %{
#              allowed: true,
#              penalty_amount: "70.00",
#              penalty_currency: "GBP"
#            }
#          },
#          created_at: "2022-02-01T11:41:41.552923Z",
#          expires_at: "2022-02-01T11:56:41.549003Z",
#          id: "off_0000AG21PqN4lA8EdnFOMO",
#          live_mode: false,
#          owner: %{
#            iata_code: "ZZ",
#            id: "arl_00009VME7D6ivUu8dn35WK",
#            name: "Duffel Airways"
#          },
#          passenger_identity_documents_required: false,
#          passengers: [
#            %{
#              age: nil,
#              family_name: nil,
#              given_name: nil,
#              id: "pas_0000AG21PpyyCmqjR1y8mm",
#              loyalty_programme_accounts: [],
#              type: "adult"
#            }
#          ],
#          payment_requirements: %{
#            payment_required_by: "2022-02-04T11:41:41Z",
#            price_guarantee_expires_at: "2022-02-03T11:41:41Z",
#            requires_instant_payment: false
#          },
#          slices: [
#            %{
#              conditions: %{
#                change_before_departure: %{
#                  allowed: false,
#                  penalty_amount: nil,
#                  penalty_currency: nil
#                }
#              },
#              destination: %{
#                airports: nil,
#                city: %{
#                  city_name: nil,
#                  iata_city_code: "LON",
#                  iata_code: "LON",
#                  iata_country_code: "GB",
#                  icao_code: nil,
#                  id: "cit_lon_gb",
#                  latitude: nil,
#                  longitude: nil,
#                  name: "London",
#                  time_zone: nil,
#                  type: "city"
#                },
#                city_name: "London",
#                iata_city_code: "LON",
#                iata_code: "LHR",
#                iata_country_code: "GB",
#                icao_code: "EGLL",
#                id: "arp_lhr_gb",
#                latitude: 51.470311,
#                longitude: -0.458118,
#                name: "Heathrow Airport",
#                time_zone: "Europe/London",
#                type: "airport"
#              },
#              destination_type: "airport",
#              duration: "PT44M",
#              fare_brand_name: "Basic",
#              id: "sli_0000AG21PqNQjqPoetPfub",
#              origin: %{
#                airports: nil,
#                city: %{
#                  city_name: nil,
#                  iata_city_code: "LON",
#                  iata_code: "LON",
#                  iata_country_code: "GB",
#                  icao_code: nil,
#                  id: "cit_lon_gb",
#                  latitude: nil,
#                  longitude: nil,
#                  name: "London",
#                  time_zone: nil,
#                  type: "city"
#                },
#                city_name: "London",
#                iata_city_code: "LON",
#                iata_code: "STN",
#                iata_country_code: "GB",
#                icao_code: "EGSS",
#                id: "arp_stn_gb",
#                latitude: 51.885508,
#                longitude: 0.236933,
#                name: "London Stansted Airport",
#                time_zone: "Europe/London",
#                type: "airport"
#              },
#              origin_type: "airport",
#              segments: [
#                %{
#                  aircraft: %{
#                    iata_code: "773",
#                    id: "arc_00009VMF8AhXSSRnQDI6HE",
#                    name: "Boeing 777-300"
#                  },
#                  arriving_at: "2022-02-01T23:44:00",
#                  departing_at: "2022-02-01T23:00:00",
#                  destination: %{
#                    airports: nil,
#                    city: %{
#                      city_name: nil,
#                      iata_city_code: "LON",
#                      iata_code: "LON",
#                      iata_country_code: "GB",
#                      icao_code: nil,
#                      id: "cit_lon_gb",
#                      latitude: nil,
#                      longitude: nil,
#                      name: "London",
#                      time_zone: nil,
#                      type: "city"
#                    },
#                    city_name: "London",
#                    iata_city_code: "LON",
#                    iata_code: "LHR",
#                    iata_country_code: "GB",
#                    icao_code: "EGLL",
#                    id: "arp_lhr_gb",
#                    latitude: 51.470311,
#                    longitude: -0.458118,
#                    name: "Heathrow Airport",
#                    time_zone: "Europe/London",
#                    type: "airport"
#                  },
#                  destination_terminal: "1",
#                  distance: "116.56256355551413",
#                  duration: "PT44M",
#                  id: "seg_0000AG21PqNQjqPoetPfuc",
#                  marketing_carrier: %{
#                    iata_code: "ZZ",
#                    id: "arl_00009VME7D6ivUu8dn35WK",
#                    name: "Duffel Airways"
#                  },
#                  marketing_carrier_flight_number: "0236",
#                  operating_carrier: %{
#                    iata_code: "ZZ",
#                    id: "arl_00009VME7D6ivUu8dn35WK",
#                    name: "Duffel Airways"
#                  },
#                  operating_carrier_flight_number: "0236",
#                  origin: %{
#                    airports: nil,
#                    city: %{city_name: nil, iata_city_code: "LON", ...},
#                    city_name: "London",
#                    iata_city_code: "LON",
#                    ...
#                  },
#                  origin_terminal: "2",
#                  passengers: [%{baggages: [...], ...}]
#                }
#              ]
#            },
#            %{
#              conditions: %{
#                change_before_departure: %{
#                  allowed: false,
#                  penalty_amount: nil,
#                  penalty_currency: nil
#                }
#              },
#              destination: %{
#                airports: nil,
#                city: %{
#                  city_name: nil,
#                  iata_city_code: "LON",
#                  iata_code: "LON",
#                  iata_country_code: "GB",
#                  icao_code: nil,
#                  id: "cit_lon_gb",
#                  latitude: nil,
#                  longitude: nil,
#                  name: "London",
#                  time_zone: nil,
#                  type: "city"
#                },
#                city_name: "London",
#                iata_city_code: "LON",
#                iata_code: "STN",
#                iata_country_code: "GB",
#                icao_code: "EGSS",
#                id: "arp_stn_gb",
#                latitude: 51.885508,
#                longitude: 0.236933,
#                name: "London Stansted Airport",
#                time_zone: "Europe/London",
#                type: "airport"
#              },
#              destination_type: "airport",
#              duration: "PT44M",
#              fare_brand_name: "Basic",
#              id: "sli_0000AG21PqNmiWhOfzZxSq",
#              origin: %{
#                airports: nil,
#                city: %{
#                  city_name: nil,
#                  iata_city_code: "LON",
#                  iata_code: "LON",
#                  iata_country_code: "GB",
#                  icao_code: nil,
#                  id: "cit_lon_gb",
#                  latitude: nil,
#                  longitude: nil,
#                  name: "London",
#                  time_zone: nil,
#                  type: "city"
#                },
#                city_name: "London",
#                iata_city_code: "LON",
#                iata_code: "LHR",
#                iata_country_code: "GB",
#                icao_code: "EGLL",
#                id: "arp_lhr_gb",
#                latitude: 51.470311,
#                longitude: -0.458118,
#                name: "Heathrow Airport",
#                time_zone: "Europe/London",
#                type: "airport"
#              },
#              origin_type: "airport",
#              segments: [
#                %{
#                  aircraft: %{
#                    iata_code: "773",
#                    id: "arc_00009VMF8AhXSSRnQDI6HE",
#                    name: "Boeing 777-300"
#                  },
#                  arriving_at: "2022-02-04T23:44:00",
#                  departing_at: "2022-02-04T23:00:00",
#                  destination: %{
#                    airports: nil,
#                    city: %{
#                      city_name: nil,
#                      iata_city_code: "LON",
#                      iata_code: "LON",
#                      iata_country_code: "GB",
#                      icao_code: nil,
#                      id: "cit_lon_gb",
#                      latitude: nil,
#                      longitude: nil,
#                      name: "London",
#                      time_zone: nil,
#                      ...
#                    },
#                    city_name: "London",
#                    iata_city_code: "LON",
#                    iata_code: "STN",
#                    iata_country_code: "GB",
#                    icao_code: "EGSS",
#                    id: "arp_stn_gb",
#                    latitude: 51.885508,
#                    longitude: 0.236933,
#                    name: "London Stansted Airport",
#                    time_zone: "Europe/London",
#                    ...
#                  },
#                  destination_terminal: "1",
#                  distance: "116.56256355551413",
#                  duration: "PT44M",
#                  id: "seg_0000AG21PqNmiWhOfzZxSr",
#                  marketing_carrier: %{
#                    iata_code: "ZZ",
#                    id: "arl_00009VME7D6ivUu8dn35WK",
#                    name: "Duffel Airways"
#                  },
#                  marketing_carrier_flight_number: "0236",
#                  operating_carrier: %{
#                    iata_code: "ZZ",
#                    id: "arl_00009VME7D6ivUu8dn35WK",
#                    name: "Duffel Airways"
#                  },
#                  operating_carrier_flight_number: "0236",
#                  origin: %{
#                    airports: nil,
#                    city: %{city_name: nil, ...},
#                    city_name: "London",
#                    ...
#                  },
#                  origin_terminal: "2",
#                  passengers: [%{...}]
#                }
#              ]
#            }
#          ],
#          tax_amount: "80.09",
#          tax_currency: "USD",
#          total_amount: "525.00",
#          total_currency: "USD",
#          total_emissions_kg: "606",
#          updated_at: "2022-02-01T11:41:41.552923Z"
#        }
#      ],
#      passengers: [
#        %{
#          age: nil,
#          family_name: nil,
#          given_name: nil,
#          id: "pas_0000AG21PpyyCmqjR1y8mm",
#          loyalty_programme_accounts: [],
#          type: "adult"
#        }
#      ],
#      slices: [
#        %{
#          created_at: "2022-02-01T11:41:41.488335Z",
#          departure_date: "2022-02-01",
#          destination: %{
#            airports: nil,
#            city: %{
#              city_name: nil,
#              iata_city_code: "LON",
#              iata_code: "LON",
#              iata_country_code: "GB",
#              icao_code: nil,
#              id: "cit_lon_gb",
#              latitude: nil,
#              longitude: nil,
#              name: "London",
#              time_zone: nil,
#              type: "city"
#            },
#            city_name: "London",
#            iata_city_code: "LON",
#            iata_code: "LHR",
#            iata_country_code: "GB",
#            icao_code: "EGLL",
#            id: "arp_lhr_gb",
#            latitude: 51.470311,
#            longitude: -0.458118,
#            name: "Heathrow Airport",
#            time_zone: "Europe/London",
#            type: "airport"
#          },
#          destination_type: "airport",
#          origin: %{
#            airports: nil,
#            city: %{
#              city_name: nil,
#              iata_city_code: "LON",
#              iata_code: "LON",
#              iata_country_code: "GB",
#              icao_code: nil,
#              id: "cit_lon_gb",
#              latitude: nil,
#              longitude: nil,
#              name: "London",
#              time_zone: nil,
#              type: "city"
#            },
#            city_name: "London",
#            iata_city_code: "LON",
#            iata_code: "STN",
#            iata_country_code: "GB",
#            icao_code: "EGSS",
#            id: "arp_stn_gb",
#            latitude: 51.885508,
#            longitude: 0.236933,
#            name: "London Stansted Airport",
#            time_zone: "Europe/London",
#            type: "airport"
#          },
#          origin_type: "airport"
#        },
#        %{
#          created_at: "2022-02-01T11:41:41.492300Z",
#          departure_date: "2022-02-04",
#          destination: %{
#            airports: nil,
#            city: %{
#              city_name: nil,
#              iata_city_code: "LON",
#              iata_code: "LON",
#              iata_country_code: "GB",
#              icao_code: nil,
#              id: "cit_lon_gb",
#              latitude: nil,
#              longitude: nil,
#              name: "London",
#              time_zone: nil,
#              type: "city"
#            },
#            city_name: "London",
#            iata_city_code: "LON",
#            iata_code: "STN",
#            iata_country_code: "GB",
#            icao_code: "EGSS",
#            id: "arp_stn_gb",
#            latitude: 51.885508,
#            longitude: 0.236933,
#            name: "London Stansted Airport",
#            time_zone: "Europe/London",
#            type: "airport"
#          },
#          destination_type: "airport",
#          origin: %{
#            airports: nil,
#            city: %{
#              city_name: nil,
#              iata_city_code: "LON",
#              iata_code: "LON",
#              iata_country_code: "GB",
#              icao_code: nil,
#              id: "cit_lon_gb",
#              latitude: nil,
#              longitude: nil,
#              name: "London",
#              time_zone: nil,
#              type: "city"
#            },
#            city_name: "London",
#            iata_city_code: "LON",
#            iata_code: "LHR",
#            iata_country_code: "GB",
#            icao_code: "EGLL",
#            id: "arp_lhr_gb",
#            latitude: 51.470311,
#            longitude: -0.458118,
#            name: "Heathrow Airport",
#            time_zone: "Europe/London",
#            type: "airport"
#          },
#          origin_type: "airport"
#        }
#      ]
#    }
#  }}

end

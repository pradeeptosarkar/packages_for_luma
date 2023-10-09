defmodule Himmel.Weather.Descriptions do
  def get_description(weather_code, day_or_night) do
    all()
    |> Map.get(to_string(weather_code))
    |> Map.get(day_or_night)
  end

  def all do
    %{
      "0" => %{
        day: %{
          text: "Sunny",
          image: "http://openweathermap.org/img/wn/01d@2x.png"
        },
        night: %{
          text: "Clear",
          image: "http://openweathermap.org/img/wn/01n@2x.png"
        }
      },
      "1" => %{
        day: %{
          text: "Mainly Sunny",
          image: "http://openweathermap.org/img/wn/01d@2x.png"
        },
        night: %{
          text: "Mainly Clear",
          image: "http://openweathermap.org/img/wn/01n@2x.png"
        }
      },
      "2" => %{
        day: %{
          text: "Partly Cloudy",
          image: "http://openweathermap.org/img/wn/02d@2x.png"
        },
        night: %{
          text: "Partly Cloudy",
          image: "http://openweathermap.org/img/wn/02n@2x.png"
        }
      },
      "3" => %{
        day: %{
          text: "Cloudy",
          image: "http://openweathermap.org/img/wn/03d@2x.png"
        },
        night: %{
          text: "Cloudy",
          image: "http://openweathermap.org/img/wn/03n@2x.png"
        }
      },
      "45" => %{
        day: %{
          text: "Foggy",
          image: "http://openweathermap.org/img/wn/50d@2x.png"
        },
        night: %{
          text: "Foggy",
          image: "http://openweathermap.org/img/wn/50n@2x.png"
        }
      },
      "48" => %{
        day: %{
          text: "Rime Fog",
          image: "http://openweathermap.org/img/wn/50d@2x.png"
        },
        night: %{
          text: "Rime Fog",
          image: "http://openweathermap.org/img/wn/50n@2x.png"
        }
      },
      "51" => %{
        day: %{
          text: "Light Drizzle",
          image: "http://openweathermap.org/img/wn/09d@2x.png"
        },
        night: %{
          text: "Light Drizzle",
          image: "http://openweathermap.org/img/wn/09n@2x.png"
        }
      },
      "53" => %{
        day: %{
          text: "Drizzle",
          image: "http://openweathermap.org/img/wn/09d@2x.png"
        },
        night: %{
          text: "Drizzle",
          image: "http://openweathermap.org/img/wn/09n@2x.png"
        }
      },
      "55" => %{
        day: %{
          text: "Heavy Drizzle",
          image: "http://openweathermap.org/img/wn/09d@2x.png"
        },
        night: %{
          text: "Heavy Drizzle",
          image: "http://openweathermap.org/img/wn/09n@2x.png"
        }
      },
      "56" => %{
        day: %{
          text: "Light Freezing Drizzle",
          image: "http://openweathermap.org/img/wn/09d@2x.png"
        },
        night: %{
          text: "Light Freezing Drizzle",
          image: "http://openweathermap.org/img/wn/09n@2x.png"
        }
      },
      "57" => %{
        day: %{
          text: "Freezing Drizzle",
          image: "http://openweathermap.org/img/wn/09d@2x.png"
        },
        night: %{
          text: "Freezing Drizzle",
          image: "http://openweathermap.org/img/wn/09n@2x.png"
        }
      },
      "61" => %{
        day: %{
          text: "Light Rain",
          image: "http://openweathermap.org/img/wn/10d@2x.png"
        },
        night: %{
          text: "Light Rain",
          image: "http://openweathermap.org/img/wn/10n@2x.png"
        }
      },
      "63" => %{
        day: %{
          text: "Rain",
          image: "http://openweathermap.org/img/wn/10d@2x.png"
        },
        night: %{
          text: "Rain",
          image: "http://openweathermap.org/img/wn/10n@2x.png"
        }
      },
      "65" => %{
        day: %{
          text: "Heavy Rain",
          image: "http://openweathermap.org/img/wn/10d@2x.png"
        },
        night: %{
          text: "Heavy Rain",
          image: "http://openweathermap.org/img/wn/10n@2x.png"
        }
      },
      "66" => %{
        day: %{
          text: "Freezing Rain",
          image: "http://openweathermap.org/img/wn/10d@2x.png"
        },
        night: %{
          text: "Freezing Rain",
          image: "http://openweathermap.org/img/wn/10n@2x.png"
        }
      },
      "67" => %{
        day: %{
          text: "Freezing Rain",
          image: "http://openweathermap.org/img/wn/10d@2x.png"
        },
        night: %{
          text: "Freezing Rain",
          image: "http://openweathermap.org/img/wn/10n@2x.png"
        }
      },
      "71" => %{
        day: %{
          text: "Light Snow",
          image: "http://openweathermap.org/img/wn/13d@2x.png"
        },
        night: %{
          text: "Light Snow",
          image: "http://openweathermap.org/img/wn/13n@2x.png"
        }
      },
      "73" => %{
        day: %{
          text: "Snow",
          image: "http://openweathermap.org/img/wn/13d@2x.png"
        },
        night: %{
          text: "Snow",
          image: "http://openweathermap.org/img/wn/13n@2x.png"
        }
      },
      "75" => %{
        day: %{
          text: "Heavy Snow",
          image: "http://openweathermap.org/img/wn/13d@2x.png"
        },
        night: %{
          text: "Heavy Snow",
          image: "http://openweathermap.org/img/wn/13n@2x.png"
        }
      },
      "77" => %{
        day: %{
          text: "Snow Grains",
          image: "http://openweathermap.org/img/wn/13d@2x.png"
        },
        night: %{
          text: "Snow Grains",
          image: "http://openweathermap.org/img/wn/13n@2x.png"
        }
      },
      "80" => %{
        day: %{
          text: "Light Showers",
          image: "http://openweathermap.org/img/wn/09d@2x.png"
        },
        night: %{
          text: "Light Showers",
          image: "http://openweathermap.org/img/wn/09n@2x.png"
        }
      },
      "81" => %{
        day: %{
          text: "Showers",
          image: "http://openweathermap.org/img/wn/09d@2x.png"
        },
        night: %{
          text: "Showers",
          image: "http://openweathermap.org/img/wn/09n@2x.png"
        }
      },
      "82" => %{
        day: %{
          text: "Heavy Showers",
          image: "http://openweathermap.org/img/wn/09d@2x.png"
        },
        night: %{
          text: "Heavy Showers",
          image: "http://openweathermap.org/img/wn/09n@2x.png"
        }
      },
      "85" => %{
        day: %{
          text: "Snow Showers",
          image: "http://openweathermap.org/img/wn/13d@2x.png"
        },
        night: %{
          text: "Snow Showers",
          image: "http://openweathermap.org/img/wn/13n@2x.png"
        }
      },
      "86" => %{
        day: %{
          text: "Snow Showers",
          image: "http://openweathermap.org/img/wn/13d@2x.png"
        },
        night: %{
          text: "Snow Showers",
          image: "http://openweathermap.org/img/wn/13n@2x.png"
        }
      },
      "95" => %{
        day: %{
          text: "Thunderstorm",
          image: "http://openweathermap.org/img/wn/11d@2x.png"
        },
        night: %{
          text: "Thunderstorm",
          image: "http://openweathermap.org/img/wn/11n@2x.png"
        }
      },
      "96" => %{
        day: %{
          text: "Thunderstorm With Hail",
          image: "http://openweathermap.org/img/wn/11d@2x.png"
        },
        night: %{
          text: "Thunderstorm With Hail",
          image: "http://openweathermap.org/img/wn/11n@2x.png"
        }
      },
      "99" => %{
        day: %{
          text: "Thunderstorm With Hail",
          image: "http://openweathermap.org/img/wn/11d@2x.png"
        },
        night: %{
          text: "Thunderstorm With Hail",
          image: "http://openweathermap.org/img/wn/11n@2x.png"
        }
      }
    }
  end
end

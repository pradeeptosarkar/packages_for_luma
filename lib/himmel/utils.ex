defmodule Himmel.Utils do
  @moduledoc false

  def web_request(url) do
    Finch.build(:get, url) |> Finch.request(Himmel.Finch)
  end

  def celsius_to_fahrenheit(celsius) do
    celsius * 1.8 + 32
  end

  def fahrenheit_to_celsius(fahrenheit) do
    (fahrenheit - 32) / 1.8
  end

  def meteo_datetime_to_struct(datetime, weather) when is_binary(datetime) do
    init_datetime =
      (datetime <> ":00Z")
      |> DateTime.from_iso8601()
      |> elem(1)

    [date, time] = [DateTime.to_date(init_datetime), DateTime.to_time(init_datetime)]

    DateTime.new(date, time, weather["timezone"]) |> elem(1)
  end

  def meteo_datetime_to_hour(datetime) when is_binary(datetime) do
    String.split(datetime, "T")
    |> List.last()
    |> String.split(":")
    |> List.first()
    |> String.to_integer()
  end

  def weekday_name_from_date(time) when is_binary(time) do
    day_number =
      time
      |> Date.from_iso8601()
      |> elem(1)
      |> Date.day_of_week()

    case day_number do
      1 -> "Mon"
      2 -> "Tue"
      3 -> "Wed"
      4 -> "Thu"
      5 -> "Fri"
      6 -> "Sat"
      7 -> "Sun"
    end
  end

  def is_datetime_day_or_night?(datetime, daily_weather_list) do
    matching_day =
      Enum.find(daily_weather_list, fn weather_day ->
        weather_day.date == DateTime.to_date(datetime)
      end)

    case datetime < matching_day.sunrise || datetime > matching_day.sunset do
      true -> :night
      false -> :day
    end
  end
end

defmodule Himmel.PlacesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Himmel.Places` context.
  """

  @doc """
  Generate a place.
  """
  def place_fixture(attrs \\ %{}) do
    {:ok, place} =
      attrs
      |> Enum.into(%{
        name: "some name",
        latitude: 120.5,
        longitude: 120.5
      })
      |> Himmel.Places.create_place()

    place
  end
end

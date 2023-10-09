defmodule Himmel.PlacesTest do
  use Himmel.DataCase

  alias Himmel.Places

  describe "places" do
    alias Himmel.Places.Place

    import Himmel.PlacesFixtures

    @invalid_attrs %{name: nil, latitude: nil, longitude: nil}

    test "list_places/0 returns all places" do
      place = place_fixture()
      assert Places.list_places() == [place]
    end

    test "get_place!/1 returns the place with given id" do
      place = place_fixture()
      assert Places.get_place!(place.id) == place
    end

    test "create_place/1 with valid data creates a place" do
      valid_attrs = %{name: "some name", latitude: 120.5, longitude: 120.5}

      assert {:ok, %Place{} = place} = Places.create_place(valid_attrs)
      assert place.name == "some name"
      assert place.latitude == 120.5
      assert place.longitude == 120.5
    end

    test "create_place/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Places.create_place(@invalid_attrs)
    end

    test "update_place/2 with valid data updates the place" do
      place = place_fixture()
      update_attrs = %{name: "some updated name", latitude: 456.7, longitude: 456.7}

      assert {:ok, %Place{} = place} = Places.update_place(place, update_attrs)
      assert place.name == "some updated name"
      assert place.latitude == 456.7
      assert place.longitude == 456.7
    end

    test "update_place/2 with invalid data returns error changeset" do
      place = place_fixture()
      assert {:error, %Ecto.Changeset{}} = Places.update_place(place, @invalid_attrs)
      assert place == Places.get_place!(place.id)
    end

    test "delete_place/1 deletes the place" do
      place = place_fixture()
      assert {:ok, %Place{}} = Places.delete_place(place)
      assert_raise Ecto.NoResultsError, fn -> Places.get_place!(place.id) end
    end

    test "change_place/1 returns a place changeset" do
      place = place_fixture()
      assert %Ecto.Changeset{} = Places.change_place(place)
    end
  end
end

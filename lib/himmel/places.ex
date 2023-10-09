defmodule Himmel.Places do
  @moduledoc """
  The Places context..
  """

  import Ecto.Query, warn: false
  alias Himmel.Places.{Place, PlaceView, Coordinates}
  alias Himmel.Repo
  alias Himmel.Places.Place

  @doc """
  Returns the list of places.

  ## Examples

      iex> list_places()
      [%Place{}, ...]

  """
  def list_places do
    Repo.all(Place)
  end

  @doc """
  Gets a single place.

  Raises `Ecto.NoResultsError` if the Place does not exist.

  ## Examples

      iex> get_place!(123)
      %Place{}

      iex> get_place!(456)
      ** (Ecto.NoResultsError)

  """
  def get_place!(id), do: Repo.get!(Place, id)

  def get_place_from_coordinates(%Coordinates{} = coordinates) do
    Repo.get_by(Place, coordinates: coordinates)
  end

  @doc """
  Creates a place.

  ## Examples

      iex> create_place(%{field: value})
      {:ok, %Place{}}

      iex> create_place(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_place(attrs \\ %{}) do
    %Place{}
    |> Place.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a place.

  ## Examples

      iex> update_place(place, %{field: new_value})
      {:ok, %Place{}}

      iex> update_place(place, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_place(%Place{} = place, attrs) do
    place
    |> Place.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a place.

  ## Examples

      iex> delete_place(place)
      {:ok, %Place{}}

      iex> delete_place(place)
      {:error, %Ecto.Changeset{}}

  """
  def delete_place(%Place{} = place) do
    Repo.delete(place)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking place changes.

  ## Examples

      iex> change_place(place)
      %Ecto.Changeset{data: %Place{}}

  """
  def change_place(%Place{} = place, attrs \\ %{}) do
    Place.changeset(place, attrs)
  end

  def create_place_view_from_search_result(%{
        name: name,
        latitude: latitude,
        longitude: longitude
      }) do
    %PlaceView{
      id: "#{latitude},#{longitude}",
      name: name,
      coordinates: %Coordinates{
        latitude: latitude,
        longitude: longitude
      },
      weather: %{},
      last_updated: nil
    }
  end

  def create_place_view_from_place(place = %Place{}) do
    %PlaceView{
      id: "#{place.coordinates.latitude},#{place.coordinates.longitude}",
      db_id: place.id,
      name: place.name,
      coordinates: place.coordinates,
      weather: %{},
      last_updated: nil
    }
  end

  @doc "Create a %PlaceView{} from user's IP details. Defaults to a static location when in a dev environment, otherwise uses the user's IP info in the details argument, and returns a %PlaceView{} with the user's city as the name, and the user's coordinates as the coordinates."
  def create_place_view_from_ip_details(details) do
    my_location = Application.get_env(:himmel, :my_location)

    {name, coordinates} =
      case my_location do
        nil ->
          {details.city, %Coordinates{latitude: details.latitude, longitude: details.longitude}}

        {name, coordinates} ->
          {name, %Coordinates{latitude: coordinates.latitude, longitude: coordinates.longitude}}
      end

    %PlaceView{
      id: "#{coordinates.latitude},#{coordinates.longitude}",
      name: name,
      coordinates: coordinates,
      weather: %{},
      last_updated: nil
    }
  end
end

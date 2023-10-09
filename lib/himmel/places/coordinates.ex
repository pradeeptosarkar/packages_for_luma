defmodule Himmel.Places.Coordinates do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :latitude, :float
    field :longitude, :float
  end

  def changeset(coordinates, attrs) do
    coordinates
    |> cast(attrs, [:latitude, :longitude])
    |> validate_required([:latitude, :longitude])
  end
end

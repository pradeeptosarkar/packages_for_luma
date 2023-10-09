defmodule Himmel.Places.PlaceView do
  defstruct [
    :id,
    :db_id,
    :name,
    :coordinates,
    :weather,
    :last_updated
  ]
end

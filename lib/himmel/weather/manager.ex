defmodule Himmel.Weather do
  use GenServer
  alias Himmel.Services
  alias Himmel.Places.PlaceView

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def get_weather(%PlaceView{} = place) do
    GenServer.call(__MODULE__, {:get, place})
  end

  def init(init_state) do
    Process.send_after(self(), :update_weather_cache, 1000)
    {:ok, init_state}
  end

  def handle_info(:update_weather_cache, state) do
    # Process.send_after(self(), :update_weather_cache, 1000)
    # Enumerate through saved places
    # for each place, get the weather api data
    # IF the weather weather api data has changed
    # broadcast to the pub sub topic for that place
    # save the updated weather in the cache
    # HimmelWeb.Endpoint.broadcast("places", "place_updated", updated_weather)

    {:noreply, state}
  end

  def handle_call({:get, %PlaceView{id: id} = place}, _from, state) do
    case Map.get(state, id) do
      nil ->
        place_with_updated_weather = Services.Weather.get_weather(place)
        new_state = Map.put(state, id, place_with_updated_weather)

        {:reply, place_with_updated_weather, new_state}

      place_with_weather ->
        {:reply, place_with_weather, state}
    end
  end

  # defp clean_weather_cache(state) do
  # ??? I like this generated idea, but I don't think it fits for this function.
  # Enumerate through saved places
  # for each place, get the weather api data
  # IF the weather weather api data has changed
  # broadcast to the pub sub topic for that place
  # save the updated weather in the cache
  # HimmelWeb.Endpoint.broadcast("places", "place_updated", updated_weather)
  # end
end

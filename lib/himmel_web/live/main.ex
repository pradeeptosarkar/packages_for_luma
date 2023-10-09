defmodule HimmelWeb.MainLive do
  use HimmelWeb, :live_component

  def render(assigns) do
    ~H"""
    <div
      id="main"
      class={"#{if @screen == :main, do: "flex", else: "hidden md:flex"} flex-col gap-3 w-full md:max-w-[400px] lg:min-w-[450px] xl:max-w-[450px] 2xl:max-w=[520px]"}
    >
      <%!-- CURRENT --%>
      <div class="self-center justify-self-center w-full ">
        <div class="flex justify-center w-full">
          <%!-- <%= if length(parent.places) > 1 && "this isn't the first place" do %> --%>
          <%!-- <button>P</button> --%>
          <%!-- <% end %> --%>
          <div class="flex flex-col items-center pt-16 pb-12">
            <h1 class="text-4xl"><%= @main_weather.name %></h1>
            <h2 class="text-8xl py-1 font-extralight">
              <%= @main_weather.temperature %>
              <span class="relative"><span class="absolute">&deg;</span></span>
            </h2>
            <h3 class="text-2xl"><%= @main_weather.description_text %></h3>
            <div class="flex justify-between gap-5 text-2xl">
              <h4>L: <%= @main_weather.low %>&deg;</h4>
              <h4>H: <%= @main_weather.high %>&deg;</h4>
            </div>
          </div>
          <%!-- <%= if length(parent.places) > 1 && "this isn't the last place" do %> --%>
          <%!-- <button>N</button> --%>
          <%!-- <% end %> --%>
        </div>
      </div>
      <%!-- TODAY --%>
      <div
        id="hours"
        class="relative flex gap-2 rounded-xl p-4 bg-red-dark overflow-x-auto whitespace-nowrap"
      >
        <%!-- HOUR COLUMNS --%>
        <.hours hours={@main_weather.hours} />
      </div>
      <%!-- 10-DAYS --%>
      <div class="flex flex-col rounded-xl pt-2 pb-4 px-4 bg-red-dark">
        <h3 class="uppercase text-red-medium text-[1.1rem]">10-Day Forecast</h3>
        <%!-- DAY ROWS --%>
        <.days days={@main_weather.days} />
      </div>
    </div>
    """
  end

  def hours(assigns) do
    ~H"""
    <%= for time <- @hours do %>
      <div class="flex flex-col items-center">
        <h3 class="text-xl"><%= time.hour %></h3>
        <div class="h-12 w-12"><img src={time.description.image} /></div>
        <span class="text-2xl"><%= time.temperature %>&deg;</span>
      </div>
    <% end %>
    """
  end

  def days(assigns) do
    ~H"""
    <%= for day <- @days do %>
      <%!-- <div class="flex justify-between text-2xl"> --%>
      <div class="grid grid-cols-4 text-2xl">
        <div class="self-center">
          <h4><%= day.weekday %></h4>
        </div>
        <div class="justify-self-center h-14 w-14"><img src={day.description.image} /></div>
        <div class="self-center justify-self-center">
          <span class="justify-self-end"><%= day.temperature.low %>&deg;</span>
        </div>
        <div class="self-center justify-self-center">
          <span class="justify-self-end"><%= day.temperature.high %>&deg;</span>
        </div>
      </div>
    <% end %>
    """
  end
end

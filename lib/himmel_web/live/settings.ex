defmodule HimmelWeb.SettingsLive do
  use HimmelWeb, :live_component

  def render(assigns) do
    ~H"""
    <div
      id="settings"
      class={"#{if @screen == :settings, do: "flex", else: "hidden xl:flex"} flex-col gap-3 pt-[120px] w-full max-w-[320px]"}
    >
      <h1 class="text-4xl font-bold ml-4">Settings</h1>
      <%!-- TEMPERATURE --%>
      <%!-- <div class="flex flex-col justify-between rounded-xl bg-red-dark py-3.5 px-4 gap-1">
        <h3 class="text-lg text-red-light pl-2">Temperature</h3>
        <div class="flex gap-9">
          <button
            phx-click="celsius"
            class={"#{if @data.temperature_scale == :celsius, do: "bg-red-vibrant border-red-darker border-4", else: "border-2 border-red-medium text-red-medium"} rounded-xl py-4 px-12 text-4xl font-light leading-none"}
          >
            C
          </button>
          <button
            phx-click="fahrenheit"
            class={"#{if @data.temperature_scale == :fahrenheit, do: "bg-red-vibrant border-red-darker border-4", else: "border-2  border-red-medium text-red-medium"} rounded-xl py-4 px-12 text-4xl font-light leading-none"}
          >
            F
          </button>
        </div>
      </div> --%>
      <%!-- ACCOUNT --%>
      <div class="flex flex-col rounded-xl bg-red-dark pt-3.5 pb-8 px-4 gap-1">
        <%!-- USE DETAILS > SUMMARY + content tags to show/hide elements --%>
        <div class="flex flex-col pl-2 pb-4">
          <h3 class="text-lg text-red-light">Account</h3>
          <%= if assigns[:current_user] do %>
            <span class="inline-block mb-2">
              <%= assigns[:current_user].email %>
            </span>
          <% else %>
            <span class="inline-block mb-2">
              Not signed in
            </span>
            <p class="text-xl py-4">
              To save your places and access weather from any device, register for a free account today.
            </p>
          <% end %>
        </div>

        <%= if assigns[:current_user] do %>
          <%!-- LOGGED IN --%>
          <details>
            <summary class="pb-6 list-none cursor-pointer">
              <span class="border border-red-light px-4 py-2 rounded-xl text-red-light">
                Manage Account / Sign Out
              </span>
            </summary>
            <div class="flex flex-col gap-4">
              <.link
                href={~p"/user/settings"}
                method="get"
                class="text-center rounded-xl py-4 px-10 text-lg text-red-light leading-none border-2 border-red-light"
              >
                Change Email / Password
              </.link>
              <.link
                href={~p"/user/log_out"}
                method="delete"
                class="text-center rounded-xl py-4 px-10 text-lg text-red-light leading-none border-2 border-red-light"
              >
                Log out
              </.link>
            </div>
          </details>
        <% else %>
          <%!-- NOT LOGGED IN --%>
          <div class="flex flex-col gap-4">
            <.link
              href={~p"/user/register"}
              method="get"
              class="text-center bg-blue-dark rounded-xl py-4 px-10 text-lg leading-none border-2"
            >
              Register
            </.link>
            <.link
              href={~p"/user/log_in"}
              method="get"
              class="text-center rounded-xl py-4 px-10 text-lg text-red-light leading-none border-2 border-red-light"
            >
              Log in
            </.link>
          </div>
        <% end %>
      </div>
    </div>
    """
  end
end

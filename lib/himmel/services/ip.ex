defmodule Himmel.Services.IP do
  import Phoenix.LiveView, only: [get_connect_info: 2]
  alias :ipinfo, as: IPinfo

  @doc "Gets the IP of the requesting client"
  def get_user_ip(socket) do
    peer_data = get_connect_info(socket, :peer_data)
    peer_data.address |> :inet.ntoa() |> to_string()
  end

  @doc "Gets the coordinates and city from an IP address"
  def get_ip_details(ip) do
    with {:ok, %IPinfo{} = handler} <- IPinfo.create(Application.get_env(:ipinfo, :token)),
         {:ok, details} <- IPinfo.details(handler, ip) do
      details
    end
  end
end

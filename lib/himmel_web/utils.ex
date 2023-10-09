defmodule HimmelWeb.Utils do
  alias Himmel.Services.IP

  def get_user_ip_details_from_socket(socket) do
    socket
    |> IP.get_user_ip()
    |> IP.get_ip_details()
  end
end

defmodule IslandsInterfaceWeb.UserSocket do
  use Phoenix.Socket

  ## Channels
  channel("game:*", IslandsInterfaceWeb.GameChannel)

  ## Transports
  transport(:websocket, Phoenix.Transports.WebSocket)

  def connect(_params, socket) do
    {:ok, socket}
  end

  def id(_socket), do: nil
end

defmodule Liveview.LocationChannel do
  use Liveview.Web, :channel
  require Logger

  def join("location:" <> location_id, payload, socket) do
    if authorized?(payload) do
      {:ok, "location:#{location_id}", socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (location:lobby).
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  def handle_in("message:new", payload, socket) do
    broadcast socket, "message:new", %{user: payload["user"], message: payload["message"]}
    {:noreply, socket}
  end

  def broadcast_new_location(location) do
    expert =
      Liveview.Repo.get(Liveview.Expert, location.expert_id)
      |> Repo.preload(:market)
    market = expert.market

    payload = %{
      expert_id: expert.id,
      expert_name: expert.fullname,
      lat: location.lat,
      lng: location.lng,
      timestamp: location.timestamp,
    }

    Liveview.Endpoint.broadcast("location:#{String.downcase(market.name)}", "location:updated", payload)
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end

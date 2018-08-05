defmodule QuieroSaber.SessionChannel do
  use QuieroSaber.Web, :channel

  def join("session:lobby", payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("next_question", payload, socket) do
    broadcast socket, "next_question", payload
    {:noreply, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (session:lobby).
  def handle_in("subscribe", payload, socket) do
    broadcast socket, "subscribe", payload
    {:noreply, socket}
  end

  def handle_in("get_results", payload, socket) do
    broadcast socket, "get_results", payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end

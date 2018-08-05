defmodule QuieroSaber.ApiParticipantController do
  use QuieroSaber.Web, :controller

  alias QuieroSaber.ApiParticipant

  def create(conn, %{"participant" => participant}, session) do
    Logger.debug "Session: #{inspect(session)}"
    Logger.debug "Participant: #{inspect(participant)}"
    render conn, "show.json", participant: %Participant{}
  end
end

require Logger

defmodule QuieroSaber.ApiParticipantController do
  use QuieroSaber.Web, :controller

  alias QuieroSaber.Participant
  alias QuieroSaber.Session

  def action(conn, _) do
    session = Repo.get!(Session, conn.params["api_session_id"])
    Logger.debug "Session: #{inspect(session)}"
    args = [conn, conn.params, session]
    apply(__MODULE__, action_name(conn), args)
  end

  def create(conn, %{"participant" => participant}, session) do
    participant = Repo.insert!(%Participant{
     device_id: participant["device_id"],
     nickname: participant["nickname"],
     session_id: session.id
    })
    render conn, "show.json", participant: participant
  end
end

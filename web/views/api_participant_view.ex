defmodule QuieroSaber.ApiParticipantView do
  use QuieroSaber.Web, :view

  def render("show.json", %{participant: participant}) do
    %{
      participant: participant_json(participant)
    }
  end

  def render("message.json", %{message: message}) do
    %{
      message: message
    }
  end

  def participant_json(participant) do
    %{
      id: participant.id,
      device_id: participant.device_id,
      nickname: participant.nickname,
      session_id: participant.session_id,
    }
  end
end

defmodule QuieroSaber.ApiParticipantView do
  use QuieroSaber.Web, :view

  def render("show.json", %{participant: participant}) do
    %{
      participant: participant
    }
  end



  def participant_json(participant) do
    %{
      device_id: participant.device_id,
      nickname: participant.nickname,
      session: participant.session,
    }
  end
end

defmodule QuieroSaber.ApiParticipantController do
  use QuieroSaber.Web, :controller

  alias QuieroSaber.ApiParticipant

  def create(conn, _params) do
    render(conn, "index.json", hello: "world")
  end
end

defmodule QuieroSaber.ApiSessionController do
  use QuieroSaber.Web, :controller

  alias QuieroSaber.Session

  def show(conn, %{"id" => id}) do
    session = Repo.get!(Session, id)
    render conn, "show.json", session: session
  end
end

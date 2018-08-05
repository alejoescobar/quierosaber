defmodule QuieroSaber.ApiSessionController do
  use QuieroSaber.Web, :controller

  alias QuieroSaber.Session

  def show(conn, %{"id" => id}) do
    session = Repo.get!(Session, id)
    render conn, "show.json", session: session
  end

  def find(conn, %{"code" => code}) do
    session = Repo.get_by(Session, code: code)
    render conn, "show.json", session: session
  end
end

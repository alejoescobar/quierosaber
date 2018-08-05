require Logger

defmodule QuieroSaber.ApiPollController do
  use QuieroSaber.Web, :controller

  alias QuieroSaber.Poll

  def show(conn, %{"id" => id}) do
    poll = Repo.get!(Poll, id)
      |> Repo.preload([:questions])
    render conn, "show.json", poll: poll
  end
end

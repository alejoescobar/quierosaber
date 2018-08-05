require Logger

defmodule QuieroSaber.ApiAnswerController do
  use QuieroSaber.Web, :controller

  alias QuieroSaber.Answer

  def create(conn, %{"answer" => answer_params}) do
    changeset = Answer.changeset(%Answer{}, answer_params)
    answer = Repo.insert!(changeset)
    render conn, "show.json", answer: answer
  end
end

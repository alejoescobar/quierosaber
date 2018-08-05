defmodule QuieroSaber.ApiQuestionController do
  use QuieroSaber.Web, :controller

  alias QuieroSaber.Question

  def show(conn, %{"id" => id}) do
    question = Repo.get!(Question, id)
      |> Repo.preload([:options])
    render conn, "show.json", question: question
  end
end

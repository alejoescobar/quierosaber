require Logger

defmodule QuieroSaber.ApiQuestionController do
  use QuieroSaber.Web, :controller

  alias QuieroSaber.Question

  def show(conn, %{"id" => id}) do
    question = Repo.get!(Question, id)
      |> Repo.preload([:options])
    render conn, "show.json", question: question
  end

  def results(conn, %{"id" => id}) do
    answer_results = Question.get_results(id, conn.params["api_session_id"])
    Logger.debug "Results: #{inspect(answer_results)}"
    render conn, "results.json", results: answer_results
  end
end

defmodule QuieroSaber.ApiPollView do
  use QuieroSaber.Web, :view

  def render("show.json", %{poll: poll}) do
    %{
      poll: polls_json(poll)
    }
  end

  def polls_json(poll) do
    %{
      id: poll.id,
      name: poll.name,
      questions: Enum.map(poll.questions, &questions_json/1)
    }
  end

  def questions_json(question) do
    %{
      id: question.id,
      order: question.order
    }
  end
end

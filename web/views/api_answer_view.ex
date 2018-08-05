defmodule QuieroSaber.ApiAnswerView do
  use QuieroSaber.Web, :view

  def render("show.json", %{answer: answer}) do
    %{
      answer: answers_json(answer)
    }
  end

  def answers_json(answer) do
    %{
      id: answer.id,
      participant_id: answer.participant_id,
      question_id: answer.question_id,
      option_id: answer.option_id
    }
  end
end

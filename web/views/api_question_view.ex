defmodule QuieroSaber.ApiQuestionView do
  use QuieroSaber.Web, :view

  def render("show.json", %{question: question}) do
    %{
      question: questions_json(question)
    }
  end

  def questions_json(question) do
    %{
      id: question.id,
      title: question.title,
      description: question.description,
      attachment: question.attachment,
      order: question.order,
      status: question.status,
      options: Enum.map(question.options, &options_json/1)
    }
  end

  def options_json(option) do
    %{
      id: option.id,
      title: option.title,
      order: option.order
    }
  end

  def render("results.json", %{results: results}) do
    %{
      results: results
    }
  end
end

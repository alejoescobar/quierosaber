defmodule QuieroSaber.QuestionTest do
  use QuieroSaber.ModelCase

  alias QuieroSaber.Question

  @valid_attrs %{attachment: "some attachment", description: "some description", order: 42, status: 42, title: "some title"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Question.changeset(%Question{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Question.changeset(%Question{}, @invalid_attrs)
    refute changeset.valid?
  end
end

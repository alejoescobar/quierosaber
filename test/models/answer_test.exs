defmodule QuieroSaber.AnswerTest do
  use QuieroSaber.ModelCase

  alias QuieroSaber.Answer

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Answer.changeset(%Answer{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Answer.changeset(%Answer{}, @invalid_attrs)
    refute changeset.valid?
  end
end

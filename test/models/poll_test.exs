defmodule QuieroSaber.PollTest do
  use QuieroSaber.ModelCase

  alias QuieroSaber.Poll

  @valid_attrs %{description: "some description", name: "some name"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Poll.changeset(%Poll{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Poll.changeset(%Poll{}, @invalid_attrs)
    refute changeset.valid?
  end
end

defmodule QuieroSaber.OptionTest do
  use QuieroSaber.ModelCase

  alias QuieroSaber.Option

  @valid_attrs %{order: 42, title: "some title"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Option.changeset(%Option{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Option.changeset(%Option{}, @invalid_attrs)
    refute changeset.valid?
  end
end

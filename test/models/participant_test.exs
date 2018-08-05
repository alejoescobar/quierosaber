defmodule QuieroSaber.ParticipantTest do
  use QuieroSaber.ModelCase

  alias QuieroSaber.Participant

  @valid_attrs %{device_id: "some device_id", nickname: "some nickname"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Participant.changeset(%Participant{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Participant.changeset(%Participant{}, @invalid_attrs)
    refute changeset.valid?
  end
end

defmodule QuieroSaber.Answer do
  use QuieroSaber.Web, :model

  schema "options" do
    belongs_to :question, QuieroSaber.Question
    belongs_to :option, QuieroSaber.Option
    belongs_to :participant, QuieroSaber.Participant
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:question_id, :option_id, :participant_id])
    |> validate_required([:question_id, :option_id, :participant_id])
  end

end
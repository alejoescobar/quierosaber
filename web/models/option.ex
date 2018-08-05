defmodule QuieroSaber.Option do
  use QuieroSaber.Web, :model

  schema "options" do
    field :title, :string
    field :order, :integer

    belongs_to :question, QuieroSaber.Question
    has_many :answers, QuieroSaber.Answer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :order, :question_id])
    |> validate_required([:title, :order, :question_id])
  end
end

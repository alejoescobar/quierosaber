defmodule QuieroSaber.Option do
  use QuieroSaber.Web, :model

  schema "options" do
    field :title, :string
    field :order, :integer

    belongs_to :question, QuieroSaber.Question
    has_many :answers, QuieroSaber.Answers

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :order])
    |> validate_required([:title, :order])
  end
end

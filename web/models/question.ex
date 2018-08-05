defmodule QuieroSaber.Question do
  use QuieroSaber.Web, :model

  schema "questions" do
    field :title, :string
    field :description, :string
    field :attachment, :string
    field :order, :integer
    field :status, :integer

    belongs_to :poll, QuieroSaber.Poll
    has_many :answers, QuieroSaber.Answer
    has_many :options, QuieroSaber.Option

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :attachment, :order, :status, :poll_id])
    |> validate_required([:title, :description, :attachment, :order, :status, :poll_id])
  end
end

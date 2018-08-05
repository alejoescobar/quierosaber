defmodule QuieroSaber.Question do
  use QuieroSaber.Web, :model

  alias QuieroSaber.Repo

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
    |> validate_required([:title, :order, :poll_id])
  end

  def get_results(question_id, session_id) do
    query = from a in QuieroSaber.Answer,
      where: a.question_id == ^question_id and a.session_id == ^session_id,
      group_by: a.option_id,
      select: %{"option_id" => a.option_id, "count" => count(a.id)}

    Repo.all(query)
  end
end

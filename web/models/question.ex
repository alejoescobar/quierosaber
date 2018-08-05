defmodule QuieroSaber.Question do
  use QuieroSaber.Web, :model

  schema "questions" do
    belongs_to :session, QuieroSaber.Session
    field :title, :string
    field :description, :string
    field :attachment, :string
    field :order, :integer
    field :status, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :attachment, :order, :status])
    |> validate_required([:title, :description, :attachment, :order, :status])
  end
end

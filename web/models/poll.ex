defmodule QuieroSaber.Poll do
  use QuieroSaber.Web, :model

  schema "polls" do
    field :name, :string
    field :description, :string

    has_many :questions, QuieroSaber.Question
    has_many :sessions, QuieroSaber.Session

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description])
    |> validate_required([:name, :description])
  end
end

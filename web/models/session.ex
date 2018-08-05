defmodule QuieroSaber.Session do
  use QuieroSaber.Web, :model

  schema "sessions" do
    field :code, :integer
    field :status, :integer

    belongs_to :poll, QuieroSaber.Poll
    has_many :participants, QuieroSaber.Participant

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:code])
    |> validate_required([:code])
  end
end

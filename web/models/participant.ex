defmodule QuieroSaber.Participant do
  use QuieroSaber.Web, :model

  schema "participants" do
    belongs_to :session, QuieroSaber.Session
    field :device_id, :string
    field :nickname, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:device_id, :nickname])
    |> validate_required([:device_id, :nickname])
  end
end

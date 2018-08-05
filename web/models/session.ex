defmodule QuieroSaber.Session do
  use QuieroSaber.Web, :model

  schema "sessions" do
    field :name, :string
    has_many :participants, QuieroSaber.Participant

    timestamps()
  end

end

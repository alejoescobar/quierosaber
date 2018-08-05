defmodule QuieroSaber.Participant do
  use QuieroSaber.Web, :model

  schema "participants" do
    field :nickname, :string
    field :device_id, :string
    belongs_to :session, QuieroSaber.Session

    timestamps()
  end

end

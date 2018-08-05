defmodule QuieroSaber.Sessions do
  use QuieroSaber.Web, :model

  schema "sessions" do
    field :name, :string
    timestamps()
  end

end

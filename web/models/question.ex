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

end

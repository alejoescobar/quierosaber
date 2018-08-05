defmodule QuieroSaber.Option do
  use QuieroSaber.Web, :model

  schema "options" do
    belongs_to :question, QuieroSaber.Question
    field :title, :string
    field :order, :integer
    timestamps()
  end

end

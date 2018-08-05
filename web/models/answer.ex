defmodule QuieroSaber.Option do
  use QuieroSaber.Web, :model

  schema "options" do
    belongs_to :question, QuieroSaber.Question
    belongs_to :option, QuieroSaber.Option
    belongs_to :participant, QuieroSaber.Participant
    timestamps()
  end

end

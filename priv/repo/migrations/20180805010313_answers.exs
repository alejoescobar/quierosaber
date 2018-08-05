defmodule QuieroSaber.Repo.Migrations.Answers do
  use Ecto.Migration

  def change do
    create table(:participants) do
      add :question_id, references(:questions)
      add :option_id, references(:options)
      add :participant_id, references(:participants)
      timestamps()
    end
  end
end

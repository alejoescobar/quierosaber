defmodule QuieroSaber.Repo.Migrations.Options do
  use Ecto.Migration

  def change do
    create table(:options) do
      add :question_id, references(:questions)
      add :title, :string
      add :order, :integer

      timestamps()
    end
  end
end

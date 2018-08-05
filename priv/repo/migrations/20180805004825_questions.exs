defmodule QuieroSaber.Repo.Migrations.Questions do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :session_id, references(:sessions)
      add :title, :string
      add :description, :string
      add :attachment, :string
      add :order, :integer
      add :status, :integer

      timestamps()
    end
  end
end

defmodule QuieroSaber.Repo.Migrations.CreatePoll do
  use Ecto.Migration

  def change do
    create table(:polls) do
      add :name, :string
      add :description, :string

      timestamps()
    end
  end
end

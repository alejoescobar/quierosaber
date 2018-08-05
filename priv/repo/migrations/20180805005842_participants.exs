defmodule QuieroSaber.Repo.Migrations.Participants do
  use Ecto.Migration

  def change do
    create table(:participants) do
      add :nickname, :string
      add :device_id, :string
      add :session_id, references(:sessions)
      timestamps()
    end
  end
end

defmodule QuieroSaber.Repo.Migrations.AddSessionToAnswer do
  use Ecto.Migration

  def change do
    alter table (:answers) do
      add :session_id, references(:sessions)
    end
  end
end

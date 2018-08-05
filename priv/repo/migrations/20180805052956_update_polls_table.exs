defmodule QuieroSaber.Repo.Migrations.UpdatePollsTable do
  use Ecto.Migration

  def change do
    alter table(:sessions) do
      remove :code
      add :code, :integer
      add :status, :integer
      add :poll_id, references(:polls)
    end

    alter table(:questions) do
      remove :session_id
      add :poll_id, references(:polls)
    end
  end
end

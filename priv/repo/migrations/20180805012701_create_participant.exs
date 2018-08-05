defmodule QuieroSaber.Repo.Migrations.CreateParticipant do
  use Ecto.Migration

  def change do
    create table(:participants) do
      add :device_id, :string
      add :nickname, :string

      timestamps()
    end
  end
end

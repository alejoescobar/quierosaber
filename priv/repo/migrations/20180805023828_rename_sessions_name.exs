defmodule QuieroSaber.Repo.Migrations.RenameSessionsName do
  use Ecto.Migration

  def change do
    rename table(:sessions), :name, to: :code
  end
end

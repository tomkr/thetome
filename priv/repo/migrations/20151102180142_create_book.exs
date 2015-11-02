defmodule Thetome.Repo.Migrations.CreateBook do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :author, :string
      add :release_date, :date

      timestamps
    end

  end
end

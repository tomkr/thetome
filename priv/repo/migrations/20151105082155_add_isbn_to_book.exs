defmodule Thetome.Repo.Migrations.AddISBNToBook do
  use Ecto.Migration

  def change do
    alter table(:books) do
      add :isbn, :string
    end
  end
end

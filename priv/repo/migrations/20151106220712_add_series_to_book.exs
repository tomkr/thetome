defmodule Thetome.Repo.Migrations.AddSeriesToBook do
  use Ecto.Migration

  def change do
    alter table(:books) do
      add :serie, :string
      add :serie_slug, :string
      remove :author_slug
    end
  end
end

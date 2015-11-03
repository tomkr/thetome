defmodule Thetome.Repo.Migrations.AddSlugsAndDescription do
  use Ecto.Migration

  def change do
    alter table(:books) do
      add :slug, :string
      add :author_slug, :string
      add :description, :text
    end
  end
end

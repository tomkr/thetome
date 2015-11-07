defmodule Thetome.Repo.Migrations.AddCoverImageUrl do
  use Ecto.Migration

  def change do
    alter table(:books) do
      add :cover_url, :string
    end
  end
end

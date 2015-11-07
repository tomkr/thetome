defmodule Thetome.Book do
  use Thetome.Web, :model

  schema "books" do
    field :title, :string
    field :slug, :string
    field :author, :string
    field :serie, :string
    field :serie_slug, :string
    field :release_date, Ecto.Date
    field :description, :string
    field :isbn, :string

    timestamps
  end

  def find_by_slugs(query, title, serie) do
    from b in query,
    where: b.slug == ^title and
           b.serie_slug == ^serie
  end

  def in_serie(query, serie) do
    from b in query,
    where: b.serie_slug == ^serie
  end

  @required_fields ~w(title author release_date serie)
  @optional_fields ~w(description isbn)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> slugify_field(:title, :slug)
    |> slugify_field(:serie, :serie_slug)
  end

  def slugify_field(changeset, field_name, slug_name) do
    if field = get_change(changeset, field_name) do
      put_change(changeset, slug_name, Slugger.slugify_downcase(field))
    else
      changeset
    end
  end
end

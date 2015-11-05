defmodule Thetome.Book do
  use Thetome.Web, :model

  schema "books" do
    field :title, :string
    field :slug, :string
    field :author, :string
    field :author_slug, :string
    field :release_date, Ecto.Date
    field :description, :string
    field :isbn, :string

    timestamps
  end

  def find_by_slugs(query, title, author) do
    from b in query,
    where: b.slug == ^title and
           b.author_slug == ^author
  end

  @required_fields ~w(title author release_date isbn)
  @optional_fields ~w(description)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> slugify_field(:title, :slug)
    |> slugify_field(:author, :author_slug)
  end

  def slugify_field(changeset, field_name, slug_name) do
    if field = get_change(changeset, field_name) do
      put_change(changeset, slug_name, Slugger.slugify_downcase(field))
    else
      changeset
    end
  end
end

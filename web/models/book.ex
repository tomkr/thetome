defmodule Thetome.Book do
  use Thetome.Web, :model

  schema "books" do
    field :title, :string
    field :author, :string
    field :release_date, Ecto.Date

    timestamps
  end

  @required_fields ~w(title author release_date)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end

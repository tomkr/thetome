defmodule Thetome.BookTest do
  use Thetome.ModelCase

  alias Thetome.Book

  @valid_attrs %{author: "Tom Kruijsen", release_date: "2010-04-17", title: "Some Title", isbn: "12345678", serie: "Some serie"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Book.changeset(%Book{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Book.changeset(%Book{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "created book has a title slug" do
    changeset = Book.changeset(%Book{}, @valid_attrs)
    {_result, book} = Repo.insert(changeset)
    assert book.slug == "some-title"
  end

  test "created book has a serie slug" do
    changeset = Book.changeset(%Book{}, @valid_attrs)
    {_result, book} = Repo.insert(changeset)
    assert book.serie_slug == "some-serie"
  end

  test "has other books in the serie" do
    Repo.insert!(%Book{title: "Book in serie", serie_slug: "serie"})
    Repo.insert!(%Book{title: "Other book in serie", serie_slug: "serie"})
    assert Enum.count(Repo.all(Book.in_serie(Book, "serie"))) == 2
  end
end

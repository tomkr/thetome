defmodule Thetome.BookTest do
  use Thetome.ModelCase

  alias Thetome.Book

  @valid_attrs %{author: "Tom Kruijsen", release_date: "2010-04-17", title: "Some Title"}
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

  test "created book has an author slug" do
    changeset = Book.changeset(%Book{}, @valid_attrs)
    {_result, book} = Repo.insert(changeset)
    assert book.author_slug == "tom-kruijsen"
  end
end

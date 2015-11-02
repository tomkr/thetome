defmodule Thetome.BookTest do
  use Thetome.ModelCase

  alias Thetome.Book

  @valid_attrs %{author: "some content", release_date: "2010-04-17", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Book.changeset(%Book{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Book.changeset(%Book{}, @invalid_attrs)
    refute changeset.valid?
  end
end

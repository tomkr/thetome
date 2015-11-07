defmodule Thetome.PageControllerTest do
  use Thetome.ConnCase

  alias Thetome.Book
  alias Thetome.Repo

  setup do
    Book.changeset(%Book{}, %{title: "Title", author: "Author", release_date: %Ecto.Date{year: 2010, month: 04, day: 17}, isbn: "12345678", serie: "Serie" })
    |> Repo.insert!
    :ok
  end

  test "has the title" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "The Tome!"
  end

  test "has a book" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Title"
  end

  test "has a book detail page" do
    conn = get conn(), "/serie/title"
    assert html_response(conn, 200) =~ "Title"
  end
end

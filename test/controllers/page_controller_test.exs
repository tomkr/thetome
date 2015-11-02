defmodule Thetome.PageControllerTest do
  use Thetome.ConnCase
  alias Thetome.Book
  alias Thetome.Repo
  alias Ecto.Adapters.SQL

  setup do
    %Book{title: "Title", author: "Author", release_date: %Ecto.Date{year: 2010, month: 04, day: 17} }
      |> Repo.insert
    :ok
  end

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "The Tome!"
  end

  test "has a book" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Title"
  end
end

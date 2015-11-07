defmodule Thetome.PageController do
  use Thetome.Web, :controller

  alias Thetome.Book

  def index(conn, _params) do
    books = Repo.all(Book)
    render(conn, "index.html", books: books)
  end

  def show(conn, params) do
    book = Book.find_by_slugs(Book, params["title"], params["serie"])
    |> Repo.one!

    render(conn, "show.html", book: book)
  end
end

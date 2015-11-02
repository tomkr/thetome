defmodule Thetome.PageController do
  use Thetome.Web, :controller

  alias Thetome.Book

  def index(conn, _params) do
    books = Repo.all(Book)
    render(conn, "index.html", books: books)
  end
end

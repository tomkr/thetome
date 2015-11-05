defmodule Thetome.PageView do
  use Thetome.Web, :view

  def cover_image_url book, size \\ "S" do
    "http://covers.openlibrary.org/b/isbn/#{book.isbn}-#{size}.jpg"
  end
end

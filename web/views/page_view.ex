defmodule Thetome.PageView do
  use Thetome.Web, :view

  def cover_image_url book do
    "http://covers.openlibrary.org/b/isbn/#{book.isbn}-S.jpg"
  end
end

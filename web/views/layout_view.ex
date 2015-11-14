defmodule Thetome.LayoutView do
  use Thetome.Web, :view

  def back_button(conn) do
    if conn.request_path == "/" do
      ""
    else
      {:safe, "<a href=\"/\" class=\"back-button\"><span></span></a>"}
    end
  end
end

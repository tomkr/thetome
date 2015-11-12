defmodule Thetome.PageViewTest do
  use Thetome.ConnCase, async: true

  test "renders a back button" do
    refute Phoenix.View.render_to_string(Thetome.PageView, "index.html", [books: []]) =~ "back-button"
  end
end

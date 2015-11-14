defmodule Thetome.LayoutViewTest do
  use Thetome.ConnCase, async: true

  test "doesn't render a back button" do
    assert Thetome.LayoutView.back_button(conn()) == ""
  end

  test "renders a back button" do
    {:safe, button} = Thetome.LayoutView.back_button(conn(:get, "/books", ""))
    assert button =~ "back-button"
  end
end

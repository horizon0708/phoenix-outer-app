defmodule OuterAppWeb.ErrorJSONTest do
  use OuterAppWeb.ConnCase, async: true

  test "renders 404" do
    assert OuterAppWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert OuterAppWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end

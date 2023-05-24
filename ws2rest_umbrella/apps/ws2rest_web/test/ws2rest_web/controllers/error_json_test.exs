defmodule Ws2restWeb.ErrorJSONTest do
  use Ws2restWeb.ConnCase, async: true

  test "renders 404" do
    assert Ws2restWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert Ws2restWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end

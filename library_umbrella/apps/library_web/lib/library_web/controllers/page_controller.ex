defmodule LibraryWeb.PageController do
  use LibraryWeb, :controller

  def home(conn, _params) do
    render(conn, :home, layout: false)
  end
end

defmodule LibraryWeb.BooksPageController do
  use LibraryWeb, :controller

  def index(conn, _params) do
    render(conn, :index, title: "foo")
  end
end

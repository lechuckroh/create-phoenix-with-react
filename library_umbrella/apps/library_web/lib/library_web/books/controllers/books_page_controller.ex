defmodule LibraryWeb.BooksPageController do
  use LibraryWeb, :controller

  alias Library.Books

  def index(conn, _params) do
    books = Books.list_books()
    render(conn, :index, books: books)
  end
end

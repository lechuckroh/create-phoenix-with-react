defmodule LibraryWeb.BooksController do
  use LibraryWeb, :controller

  alias Library.Books
  alias Library.Books.Book

  action_fallback LibraryWeb.FallbackController

  def index(conn, _params) do
    books = Books.list_books()
    render(conn, :index, books: books)
  end

  def create(conn, %{"book" => book_params}) do
    with {:ok, %Book{} = book} <- Books.create_book(book_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/books/#{book}")
      |> render(:show, book: book)
    end
  end

  def show(conn, %{"id" => id}) do
    try do
      book = Books.get_book!(id)
      render(conn, :show, book: book)
    rescue
      [ Ecto.NoResultsError ] ->
        conn
        |> put_status(:not_found)
        |> put_view(html: LibraryWeb.ErrorHTML, json: LibraryWeb.ErrorJSON)
        |> render(:"404")
    end
  end

  def update(conn, %{"id" => id, "book" => book_params}) do
    book = Books.get_book!(id)

    with {:ok, %Book{} = book} <- Books.update_book(book, book_params) do
      render(conn, :show, book: book)
    end
  end

  def delete(conn, %{"id" => id}) do
    book = Books.get_book!(id)

    with {:ok, %Book{}} <- Books.delete_book(book) do
      send_resp(conn, :no_content, "")
    end
  end
end

defmodule LibraryWeb.BooksJSON do
  alias Library.Books.Book

  @doc """
  Renders a list of books.
  """
  def index(%{books: books}) do
    %{data: for(book <- books, do: data(book))}
  end

  @doc """
  Renders a single book.
  """
  def show(%{book: book}) do
    %{data: data(book)}
  end

  defp data(%Book{} = book) do
    %{
      id: book.id,
      title: book.title,
      isbn: book.isbn,
      publication_date: book.publication_date,
      publisher: book.publisher,
      edition: book.edition
    }
  end
end

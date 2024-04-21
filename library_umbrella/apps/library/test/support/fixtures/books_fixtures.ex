defmodule Library.BooksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Library.Books` context.
  """

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        edition: 42,
        isbn: "some isbn",
        publication_date: ~D[2024-04-20],
        publisher: "some publisher",
        title: "some title"
      })
      |> Library.Books.create_book()

    book
  end
end

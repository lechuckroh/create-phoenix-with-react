defmodule LibraryWeb.BooksPageHTML do
  use LibraryWeb, :html

  embed_templates "../templates/pages/*"

  attr :book, LibraryWeb.Books.Book, default: nil

  def book_cover(assigns) do
    ~H"""
    <h2><%= @book.title %></h2>
    <ul>
      <li>ISBN: <%= @book.isbn %></li>
      <li>Edition: <%= @book.edition %></li>
      <li>Publisher: <%= @book.publisher %></li>
      <li>Publication Date: <%= @book.publication_date %></li>
    </ul>
    """
  end
end

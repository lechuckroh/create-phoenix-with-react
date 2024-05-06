defmodule LibraryWeb.BooksPageHTML do
  use LibraryWeb, :html

  embed_templates "../templates/pages/*"

  attr :book, LibraryWeb.Books.Book, default: nil

  def book_cover(assigns) do
    ~H"""
    <div class="card w-96 bg-base-100 shadow-xl">
      <div class="card-body">
        <h2 class="card-title"><%= @book.title %></h2>
        <ul>
          <li>ISBN: <%= @book.isbn %></li>
          <li>Edition: <%= @book.edition %></li>
          <li>Publisher: <%= @book.publisher %></li>
          <li>Publication Date: <%= @book.publication_date %></li>
        </ul>
        <div class="card-actions justify-end">
          <button class="btn btn-primary">Show</button>
        </div>
      </div>
    </div>
    """
  end
end

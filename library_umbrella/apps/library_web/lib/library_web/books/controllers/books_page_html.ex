defmodule LibraryWeb.BooksPageHTML do
  use LibraryWeb, :html

  embed_templates "../templates/pages/*"

  attr :title, :string, default: nil

  def title(assigns) do
    ~H"""
    <h2>Title: <%= @title %></h2>
    """
  end
end

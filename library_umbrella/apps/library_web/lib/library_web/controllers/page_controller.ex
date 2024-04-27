defmodule LibraryWeb.PageController do
  use LibraryWeb, :controller

  def home(conn, _params) do
    render(conn, :home, layout: false)
  end

  def books(conn, _params) do
    render(conn, :books)
  end
end

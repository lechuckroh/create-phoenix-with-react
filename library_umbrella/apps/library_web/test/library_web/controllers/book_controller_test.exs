defmodule LibraryWeb.BookControllerTest do
  use LibraryWeb.ConnCase

  import Library.BooksFixtures

  alias Library.Books.Book

  @create_attrs %{
    title: "some title",
    isbn: "some isbn",
    publication_date: ~D[2024-04-20],
    publisher: "some publisher",
    edition: 42
  }
  @update_attrs %{
    title: "some updated title",
    isbn: "some updated isbn",
    publication_date: ~D[2024-04-21],
    publisher: "some updated publisher",
    edition: 43
  }
  @invalid_attrs %{title: nil, isbn: nil, publication_date: nil, publisher: nil, edition: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all books", %{conn: conn} do
      conn = get(conn, ~p"/api/books")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create book" do
    test "renders book when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/books", book: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/books/#{id}")

      assert %{
               "id" => ^id,
               "edition" => 42,
               "isbn" => "some isbn",
               "publication_date" => "2024-04-20",
               "publisher" => "some publisher",
               "title" => "some title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/books", book: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update book" do
    setup [:create_book]

    test "renders book when data is valid", %{conn: conn, book: %Book{id: id} = book} do
      conn = put(conn, ~p"/api/books/#{book}", book: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/books/#{id}")

      assert %{
               "id" => ^id,
               "edition" => 43,
               "isbn" => "some updated isbn",
               "publication_date" => "2024-04-21",
               "publisher" => "some updated publisher",
               "title" => "some updated title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, book: book} do
      conn = put(conn, ~p"/api/books/#{book}", book: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete book" do
    setup [:create_book]

    test "deletes chosen book", %{conn: conn, book: book} do
      conn = delete(conn, ~p"/api/books/#{book}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/books/#{book}")
      end
    end
  end

  defp create_book(_) do
    book = book_fixture()
    %{book: book}
  end
end

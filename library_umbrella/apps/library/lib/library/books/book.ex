defmodule Library.Books.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :title, :string
    field :isbn, :string
    field :publication_date, :date
    field :publisher, :string
    field :edition, :integer

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :isbn, :publication_date, :publisher, :edition])
    |> validate_required([:title, :isbn, :publication_date, :publisher, :edition])
    |> validate_length(:isbn, is: 13)
  end
end

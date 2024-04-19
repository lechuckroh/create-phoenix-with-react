# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Library.Repo.insert!(%Library.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Library.Book
alias Library.Repo

books_path = "priv/repo/seeds/books.json"

books_path
|> File.read!()
|> Jason.decode!()
|> Enum.each(fn attrs ->
  %Book{}
  |> Book.changeset(attrs)
  |> Repo.insert()
end)

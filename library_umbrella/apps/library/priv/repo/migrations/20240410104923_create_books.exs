defmodule Library.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :isbn, :string
      add :publication_date, :date
      add :publisher, :string
      add :edition, :integer

      timestamps()
    end
  end
end

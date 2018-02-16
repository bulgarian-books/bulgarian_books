defmodule BulgarianBooks.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :isbn, :string
      add :title, :string
      add :cover, :string
      add :issue, :integer
      add :description, :text
      add :copies, :integer
      add :publish_data, :date
      add :publisher_id, references(:publishers, on_delete: :nothing)
      add :language_id, references(:languages, on_delete: :nothing)
      add :genre_id, references(:genres, on_delete: :nothing)
      add :category_id, references(:categories, on_delete: :nothing)

      timestamps()
    end

    create index(:books, [:publisher_id])
    create index(:books, [:language_id])
    create index(:books, [:genre_id])
    create index(:books, [:category_id])
  end
end

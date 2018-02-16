defmodule BulgarianBooks.Repo.Migrations.CreateAuthors do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :name, :string
      add :nationality, :string

      timestamps()
    end

  end
end

defmodule BulgarianBooks.Repo.Migrations.CreatePublishers do
  use Ecto.Migration

  def change do
    create table(:publishers) do
      add :name, :string
      add :code, :string
      add :page, :integer
      add :state, :string

      timestamps()
    end

  end
end

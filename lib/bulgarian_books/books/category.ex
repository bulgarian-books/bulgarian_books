defmodule BulgarianBooks.Books.Category do
  use Ecto.Schema
  import Ecto.Changeset
  alias BulgarianBooks.Books.{Category, Book}

  schema "categories" do
    field :name, :string
    has_many :books, Book
    
    timestamps()
  end

  @doc false
  def changeset(%Category{} = category, attrs) do
    category
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end

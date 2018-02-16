defmodule BulgarianBooks.Books.Genre do
  use Ecto.Schema
  import Ecto.Changeset
  alias BulgarianBooks.Books.{Genre, Book}


  schema "genres" do
    field :name, :string
    has_many :books, Book

    timestamps()
  end

  @doc false
  def changeset(%Genre{} = genre, attrs) do
    genre
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end

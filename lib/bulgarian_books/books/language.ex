defmodule BulgarianBooks.Books.Language do
  use Ecto.Schema
  import Ecto.Changeset
  alias BulgarianBooks.Books.{Language, Book}


  schema "languages" do
    field :name, :string
    has_many :books, Book

    timestamps()
  end

  @doc false
  def changeset(%Language{} = language, attrs) do
    language
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end

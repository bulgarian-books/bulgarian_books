defmodule BulgarianBooks.Books.Book do
  use Ecto.Schema
  import Ecto.Changeset
  alias BulgarianBooks.Books.{Book, Language, Publisher, Genre, Category}


  schema "books" do
    field :copies, :integer
    field :cover, :string
    field :description, :string
    field :isbn, :string
    field :issue, :integer
    field :publish_data, :date
    field :title, :string
    belongs_to :publisher, Publisher
    belongs_to :language, Language
    belongs_to :genre, Genre
    belongs_to :category, Category

    timestamps()
  end

  @doc false
  def changeset(%Book{} = book, attrs) do
    book
    |> cast(attrs, [:isbn, :title, :cover, :issue, :description, :copies, :publish_data])
    |> validate_required([:isbn, :title, :cover, :issue, :description, :copies, :publish_data])
  end
end

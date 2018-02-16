defmodule BulgarianBooks.Books.Author do
  use Ecto.Schema
  import Ecto.Changeset
  alias BulgarianBooks.Books.Author


  schema "authors" do
    field :name, :string
    field :nationality, :string

    timestamps()
  end

  @doc false
  def changeset(%Author{} = author, attrs) do
    author
    |> cast(attrs, [:name, :nationality])
    |> validate_required([:name, :nationality])
  end
end

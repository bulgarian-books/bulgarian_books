defmodule BulgarianBooksWeb.Schema do
  use Absinthe.Schema

  alias BulgarianBooks.Books.Author
  alias BulgarianBooks.Repo

  query do

    field :authors, list_of(:author) do
      resolve fn _, _, _ ->
        {:ok, Repo.all(Author)}
      end
    end

  end

  object :author do
    field :id, :id
    field :name, :string
    field :nationality, :string
  end
end

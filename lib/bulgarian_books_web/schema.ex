defmodule BulgarianBooksWeb.Schema do
  use Absinthe.Schema

  alias BulgarianBooks.Books.Author
  alias BulgarianBooks.Repo

  import_types __MODULE__.AuthorTypes

  query do
    field :authors, list_of(:author) do
      resolve fn _, _, _ ->
        {:ok, Repo.all(Author)}
      end
    end
  end
end

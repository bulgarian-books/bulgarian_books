defmodule BulgarianBooksWeb.Schema do
  use Absinthe.Schema
  use Absinthe.Ecto, repo: BulgarianBooks.Repo

  alias BulgarianBooks.Books.{Author, Publisher, Book, Language, Genre, Category}
  alias BulgarianBooks.Repo

  import_types __MODULE__.AuthorTypes

  query do
    field :authors, list_of(:author) do
      resolve fn _, _, _ ->
        {:ok, Repo.all(Author)}
      end
    end

    field :publishers, list_of(:publisher) do
      resolve fn _, _, _ ->
        {:ok, Repo.all(Publisher)}
      end
    end

    field :languages, list_of(:language) do
      resolve fn _, _, _ ->
        {:ok, Repo.all(Language)}
      end
    end

    field :genres, list_of(:genre) do
      resolve fn _, _, _ ->
        {:ok, Repo.all(Genre)}
      end
    end

    field :categories, list_of(:category) do
      resolve fn _, _, _ ->
        {:ok, Repo.all(Category)}
      end
    end
    
    field :books, list_of(:book) do
      resolve fn _, _, _ ->
        {:ok, Repo.all(Book)}
      end
    end
  end

  object :publisher do
    field :name, :string
    field :books, list_of(:book), resolve: assoc(:books)
  end

  object :language do
    field :name, :string
    field :books, list_of(:book), resolve: assoc(:books)
  end

  object :genre do
    field :name, :string
    field :books, list_of(:book), resolve: assoc(:books)
  end

  object :category do
    field :name, :string
    field :books, list_of(:book), resolve: assoc(:books)
  end

  object :book do
    field :title, :string
    field :language, :language, resolve: assoc(:language)
    field :publisher, :publisher, resolve: assoc(:publisher)
    field :genre, :genre, resolve: assoc(:genre)
    field :category, :category, resolve: assoc(:category)
  end
end

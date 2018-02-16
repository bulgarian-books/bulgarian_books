defmodule BulgarianBooks.BooksTest do
  use BulgarianBooks.DataCase

  alias BulgarianBooks.Books

  describe "authors" do
    alias BulgarianBooks.Books.Author

    @valid_attrs %{name: "some name", nationality: "some nationality"}
    @update_attrs %{name: "some updated name", nationality: "some updated nationality"}
    @invalid_attrs %{name: nil, nationality: nil}

    def author_fixture(attrs \\ %{}) do
      {:ok, author} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Books.create_author()

      author
    end

    test "list_authors/0 returns all authors" do
      author = author_fixture()
      assert Books.list_authors() == [author]
    end

    test "get_author!/1 returns the author with given id" do
      author = author_fixture()
      assert Books.get_author!(author.id) == author
    end

    test "create_author/1 with valid data creates a author" do
      assert {:ok, %Author{} = author} = Books.create_author(@valid_attrs)
      assert author.name == "some name"
      assert author.nationality == "some nationality"
    end

    test "create_author/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Books.create_author(@invalid_attrs)
    end

    test "update_author/2 with valid data updates the author" do
      author = author_fixture()
      assert {:ok, author} = Books.update_author(author, @update_attrs)
      assert %Author{} = author
      assert author.name == "some updated name"
      assert author.nationality == "some updated nationality"
    end

    test "update_author/2 with invalid data returns error changeset" do
      author = author_fixture()
      assert {:error, %Ecto.Changeset{}} = Books.update_author(author, @invalid_attrs)
      assert author == Books.get_author!(author.id)
    end

    test "delete_author/1 deletes the author" do
      author = author_fixture()
      assert {:ok, %Author{}} = Books.delete_author(author)
      assert_raise Ecto.NoResultsError, fn -> Books.get_author!(author.id) end
    end

    test "change_author/1 returns a author changeset" do
      author = author_fixture()
      assert %Ecto.Changeset{} = Books.change_author(author)
    end
  end

  describe "publishers" do
    alias BulgarianBooks.Books.Publisher

    @valid_attrs %{code: "some code", name: "some name", page: 42, state: "some state"}
    @update_attrs %{code: "some updated code", name: "some updated name", page: 43, state: "some updated state"}
    @invalid_attrs %{code: nil, name: nil, page: nil, state: nil}

    def publisher_fixture(attrs \\ %{}) do
      {:ok, publisher} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Books.create_publisher()

      publisher
    end

    test "list_publishers/0 returns all publishers" do
      publisher = publisher_fixture()
      assert Books.list_publishers() == [publisher]
    end

    test "get_publisher!/1 returns the publisher with given id" do
      publisher = publisher_fixture()
      assert Books.get_publisher!(publisher.id) == publisher
    end

    test "create_publisher/1 with valid data creates a publisher" do
      assert {:ok, %Publisher{} = publisher} = Books.create_publisher(@valid_attrs)
      assert publisher.code == "some code"
      assert publisher.name == "some name"
      assert publisher.page == 42
      assert publisher.state == "some state"
    end

    test "create_publisher/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Books.create_publisher(@invalid_attrs)
    end

    test "update_publisher/2 with valid data updates the publisher" do
      publisher = publisher_fixture()
      assert {:ok, publisher} = Books.update_publisher(publisher, @update_attrs)
      assert %Publisher{} = publisher
      assert publisher.code == "some updated code"
      assert publisher.name == "some updated name"
      assert publisher.page == 43
      assert publisher.state == "some updated state"
    end

    test "update_publisher/2 with invalid data returns error changeset" do
      publisher = publisher_fixture()
      assert {:error, %Ecto.Changeset{}} = Books.update_publisher(publisher, @invalid_attrs)
      assert publisher == Books.get_publisher!(publisher.id)
    end

    test "delete_publisher/1 deletes the publisher" do
      publisher = publisher_fixture()
      assert {:ok, %Publisher{}} = Books.delete_publisher(publisher)
      assert_raise Ecto.NoResultsError, fn -> Books.get_publisher!(publisher.id) end
    end

    test "change_publisher/1 returns a publisher changeset" do
      publisher = publisher_fixture()
      assert %Ecto.Changeset{} = Books.change_publisher(publisher)
    end
  end

  describe "languages" do
    alias BulgarianBooks.Books.Language

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def language_fixture(attrs \\ %{}) do
      {:ok, language} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Books.create_language()

      language
    end

    test "list_languages/0 returns all languages" do
      language = language_fixture()
      assert Books.list_languages() == [language]
    end

    test "get_language!/1 returns the language with given id" do
      language = language_fixture()
      assert Books.get_language!(language.id) == language
    end

    test "create_language/1 with valid data creates a language" do
      assert {:ok, %Language{} = language} = Books.create_language(@valid_attrs)
      assert language.name == "some name"
    end

    test "create_language/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Books.create_language(@invalid_attrs)
    end

    test "update_language/2 with valid data updates the language" do
      language = language_fixture()
      assert {:ok, language} = Books.update_language(language, @update_attrs)
      assert %Language{} = language
      assert language.name == "some updated name"
    end

    test "update_language/2 with invalid data returns error changeset" do
      language = language_fixture()
      assert {:error, %Ecto.Changeset{}} = Books.update_language(language, @invalid_attrs)
      assert language == Books.get_language!(language.id)
    end

    test "delete_language/1 deletes the language" do
      language = language_fixture()
      assert {:ok, %Language{}} = Books.delete_language(language)
      assert_raise Ecto.NoResultsError, fn -> Books.get_language!(language.id) end
    end

    test "change_language/1 returns a language changeset" do
      language = language_fixture()
      assert %Ecto.Changeset{} = Books.change_language(language)
    end
  end

  describe "genres" do
    alias BulgarianBooks.Books.Genre

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def genre_fixture(attrs \\ %{}) do
      {:ok, genre} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Books.create_genre()

      genre
    end

    test "list_genres/0 returns all genres" do
      genre = genre_fixture()
      assert Books.list_genres() == [genre]
    end

    test "get_genre!/1 returns the genre with given id" do
      genre = genre_fixture()
      assert Books.get_genre!(genre.id) == genre
    end

    test "create_genre/1 with valid data creates a genre" do
      assert {:ok, %Genre{} = genre} = Books.create_genre(@valid_attrs)
      assert genre.name == "some name"
    end

    test "create_genre/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Books.create_genre(@invalid_attrs)
    end

    test "update_genre/2 with valid data updates the genre" do
      genre = genre_fixture()
      assert {:ok, genre} = Books.update_genre(genre, @update_attrs)
      assert %Genre{} = genre
      assert genre.name == "some updated name"
    end

    test "update_genre/2 with invalid data returns error changeset" do
      genre = genre_fixture()
      assert {:error, %Ecto.Changeset{}} = Books.update_genre(genre, @invalid_attrs)
      assert genre == Books.get_genre!(genre.id)
    end

    test "delete_genre/1 deletes the genre" do
      genre = genre_fixture()
      assert {:ok, %Genre{}} = Books.delete_genre(genre)
      assert_raise Ecto.NoResultsError, fn -> Books.get_genre!(genre.id) end
    end

    test "change_genre/1 returns a genre changeset" do
      genre = genre_fixture()
      assert %Ecto.Changeset{} = Books.change_genre(genre)
    end
  end

  describe "categories" do
    alias BulgarianBooks.Books.Category

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Books.create_category()

      category
    end

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Books.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Books.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      assert {:ok, %Category{} = category} = Books.create_category(@valid_attrs)
      assert category.name == "some name"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Books.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      assert {:ok, category} = Books.update_category(category, @update_attrs)
      assert %Category{} = category
      assert category.name == "some updated name"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Books.update_category(category, @invalid_attrs)
      assert category == Books.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Books.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Books.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Books.change_category(category)
    end
  end

  describe "books" do
    alias BulgarianBooks.Books.Book

    @valid_attrs %{copies: 42, cover: "some cover", description: "some description", isbn: "some isbn", issue: 42, publish_data: ~D[2010-04-17], title: "some title"}
    @update_attrs %{copies: 43, cover: "some updated cover", description: "some updated description", isbn: "some updated isbn", issue: 43, publish_data: ~D[2011-05-18], title: "some updated title"}
    @invalid_attrs %{copies: nil, cover: nil, description: nil, isbn: nil, issue: nil, publish_data: nil, title: nil}

    def book_fixture(attrs \\ %{}) do
      {:ok, book} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Books.create_book()

      book
    end

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Books.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Books.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      assert {:ok, %Book{} = book} = Books.create_book(@valid_attrs)
      assert book.copies == 42
      assert book.cover == "some cover"
      assert book.description == "some description"
      assert book.isbn == "some isbn"
      assert book.issue == 42
      assert book.publish_data == ~D[2010-04-17]
      assert book.title == "some title"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Books.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      assert {:ok, book} = Books.update_book(book, @update_attrs)
      assert %Book{} = book
      assert book.copies == 43
      assert book.cover == "some updated cover"
      assert book.description == "some updated description"
      assert book.isbn == "some updated isbn"
      assert book.issue == 43
      assert book.publish_data == ~D[2011-05-18]
      assert book.title == "some updated title"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Books.update_book(book, @invalid_attrs)
      assert book == Books.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Books.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Books.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Books.change_book(book)
    end
  end
end

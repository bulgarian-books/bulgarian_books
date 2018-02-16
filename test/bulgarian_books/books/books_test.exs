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
end

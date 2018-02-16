defmodule BulgarianBooksWeb.BookView do
  use BulgarianBooksWeb, :view
  alias BulgarianBooksWeb.BookView

  def render("index.json", %{books: books}) do
    %{data: render_many(books, BookView, "book.json")}
  end

  def render("show.json", %{book: book}) do
    %{data: render_one(book, BookView, "book.json")}
  end

  def render("book.json", %{book: book}) do
    %{id: book.id,
      isbn: book.isbn,
      title: book.title,
      cover: book.cover,
      issue: book.issue,
      description: book.description,
      copies: book.copies,
      publish_data: book.publish_data}
  end
end

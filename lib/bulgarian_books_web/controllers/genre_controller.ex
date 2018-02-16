defmodule BulgarianBooksWeb.GenreController do
  use BulgarianBooksWeb, :controller

  alias BulgarianBooks.Books
  alias BulgarianBooks.Books.Genre

  action_fallback BulgarianBooksWeb.FallbackController

  def index(conn, _params) do
    genres = Books.list_genres()
    render(conn, "index.json", genres: genres)
  end

  def create(conn, %{"genre" => genre_params}) do
    with {:ok, %Genre{} = genre} <- Books.create_genre(genre_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", genre_path(conn, :show, genre))
      |> render("show.json", genre: genre)
    end
  end

  def show(conn, %{"id" => id}) do
    genre = Books.get_genre!(id)
    render(conn, "show.json", genre: genre)
  end

  def update(conn, %{"id" => id, "genre" => genre_params}) do
    genre = Books.get_genre!(id)

    with {:ok, %Genre{} = genre} <- Books.update_genre(genre, genre_params) do
      render(conn, "show.json", genre: genre)
    end
  end

  def delete(conn, %{"id" => id}) do
    genre = Books.get_genre!(id)
    with {:ok, %Genre{}} <- Books.delete_genre(genre) do
      send_resp(conn, :no_content, "")
    end
  end
end

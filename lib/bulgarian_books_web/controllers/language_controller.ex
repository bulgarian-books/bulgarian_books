defmodule BulgarianBooksWeb.LanguageController do
  use BulgarianBooksWeb, :controller

  alias BulgarianBooks.Books
  alias BulgarianBooks.Books.Language

  action_fallback BulgarianBooksWeb.FallbackController

  def index(conn, _params) do
    languages = Books.list_languages()
    render(conn, "index.json", languages: languages)
  end

  def create(conn, %{"language" => language_params}) do
    with {:ok, %Language{} = language} <- Books.create_language(language_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", language_path(conn, :show, language))
      |> render("show.json", language: language)
    end
  end

  def show(conn, %{"id" => id}) do
    language = Books.get_language!(id)
    render(conn, "show.json", language: language)
  end

  def update(conn, %{"id" => id, "language" => language_params}) do
    language = Books.get_language!(id)

    with {:ok, %Language{} = language} <- Books.update_language(language, language_params) do
      render(conn, "show.json", language: language)
    end
  end

  def delete(conn, %{"id" => id}) do
    language = Books.get_language!(id)
    with {:ok, %Language{}} <- Books.delete_language(language) do
      send_resp(conn, :no_content, "")
    end
  end
end

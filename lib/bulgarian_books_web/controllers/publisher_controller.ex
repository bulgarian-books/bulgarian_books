defmodule BulgarianBooksWeb.PublisherController do
  use BulgarianBooksWeb, :controller

  alias BulgarianBooks.Books
  alias BulgarianBooks.Books.Publisher

  action_fallback BulgarianBooksWeb.FallbackController

  def index(conn, _params) do
    publishers = Books.list_publishers()
    render(conn, "index.json", publishers: publishers)
  end

  def create(conn, %{"publisher" => publisher_params}) do
    with {:ok, %Publisher{} = publisher} <- Books.create_publisher(publisher_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", publisher_path(conn, :show, publisher))
      |> render("show.json", publisher: publisher)
    end
  end

  def show(conn, %{"id" => id}) do
    publisher = Books.get_publisher!(id)
    render(conn, "show.json", publisher: publisher)
  end

  def update(conn, %{"id" => id, "publisher" => publisher_params}) do
    publisher = Books.get_publisher!(id)

    with {:ok, %Publisher{} = publisher} <- Books.update_publisher(publisher, publisher_params) do
      render(conn, "show.json", publisher: publisher)
    end
  end

  def delete(conn, %{"id" => id}) do
    publisher = Books.get_publisher!(id)
    with {:ok, %Publisher{}} <- Books.delete_publisher(publisher) do
      send_resp(conn, :no_content, "")
    end
  end
end

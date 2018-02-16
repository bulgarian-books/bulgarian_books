defmodule BulgarianBooksWeb.PublisherControllerTest do
  use BulgarianBooksWeb.ConnCase

  alias BulgarianBooks.Books
  alias BulgarianBooks.Books.Publisher

  @create_attrs %{code: "some code", name: "some name", page: 42, state: "some state"}
  @update_attrs %{code: "some updated code", name: "some updated name", page: 43, state: "some updated state"}
  @invalid_attrs %{code: nil, name: nil, page: nil, state: nil}

  def fixture(:publisher) do
    {:ok, publisher} = Books.create_publisher(@create_attrs)
    publisher
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all publishers", %{conn: conn} do
      conn = get conn, publisher_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create publisher" do
    test "renders publisher when data is valid", %{conn: conn} do
      conn = post conn, publisher_path(conn, :create), publisher: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, publisher_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "code" => "some code",
        "name" => "some name",
        "page" => 42,
        "state" => "some state"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, publisher_path(conn, :create), publisher: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update publisher" do
    setup [:create_publisher]

    test "renders publisher when data is valid", %{conn: conn, publisher: %Publisher{id: id} = publisher} do
      conn = put conn, publisher_path(conn, :update, publisher), publisher: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, publisher_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "code" => "some updated code",
        "name" => "some updated name",
        "page" => 43,
        "state" => "some updated state"}
    end

    test "renders errors when data is invalid", %{conn: conn, publisher: publisher} do
      conn = put conn, publisher_path(conn, :update, publisher), publisher: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete publisher" do
    setup [:create_publisher]

    test "deletes chosen publisher", %{conn: conn, publisher: publisher} do
      conn = delete conn, publisher_path(conn, :delete, publisher)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, publisher_path(conn, :show, publisher)
      end
    end
  end

  defp create_publisher(_) do
    publisher = fixture(:publisher)
    {:ok, publisher: publisher}
  end
end

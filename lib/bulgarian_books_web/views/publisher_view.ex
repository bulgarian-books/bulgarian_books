defmodule BulgarianBooksWeb.PublisherView do
  use BulgarianBooksWeb, :view
  alias BulgarianBooksWeb.PublisherView

  def render("index.json", %{publishers: publishers}) do
    %{data: render_many(publishers, PublisherView, "publisher.json")}
  end

  def render("show.json", %{publisher: publisher}) do
    %{data: render_one(publisher, PublisherView, "publisher.json")}
  end

  def render("publisher.json", %{publisher: publisher}) do
    %{id: publisher.id,
      name: publisher.name,
      code: publisher.code,
      page: publisher.page,
      state: publisher.state}
  end
end

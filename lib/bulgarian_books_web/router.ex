defmodule BulgarianBooksWeb.Router do
  use BulgarianBooksWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api
  
    resources "/authors", AuthorController, except: [:new, :edit]
    resources "/publishers", PublisherController, except: [:new, :edit]

    forward "/api", Absinthe.Plug,
      schema: BulgarianBooksWeb.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: BulgarianBooksWeb.Schema,
      interface: :simple
  end
end

defmodule BulgarianBooksWeb.Schema.AuthorTypes do
  use Absinthe.Schema.Notation

  object :author do
    field :id, :id
    field :name, :string
    field :nationality, :string
  end
end

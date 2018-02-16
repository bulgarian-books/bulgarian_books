defmodule BulgarianBooks.Books.Publisher do
  use Ecto.Schema
  import Ecto.Changeset
  alias BulgarianBooks.Books.Publisher


  schema "publishers" do
    field :code, :string
    field :name, :string
    field :page, :integer
    field :state, :string

    timestamps()
  end

  @doc false
  def changeset(%Publisher{} = publisher, attrs) do
    publisher
    |> cast(attrs, [:name, :code, :page, :state])
    |> validate_required([:name, :code, :page, :state])
  end
end

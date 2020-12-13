defmodule Loquor.Schemas.Comment do
  use Loquor.Schema
  import Ecto.Changeset
  alias Loquor.Schemas.Post
  alias Loquor.Schemas.User

  schema "comments" do
    field :content, :string

    belongs_to(:user, User)
    belongs_to(:post, Post)

    timestamps()
  end

  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:content, :user, :post])
    |> validate_required([:content, :user, :post])
    |> assoc_constraint(:post)
    |> assoc_constraint(:user)
  end
end

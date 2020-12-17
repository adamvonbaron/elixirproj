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

  def datasource(), do: Dataloader.Ecto.new(Loquor.Repo, query: &query/2)
  def query(queryable, _params), do: queryable

  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:content, :user_id, :post_id])
    |> validate_required([:content, :user_id, :post_id])
    |> assoc_constraint(:post)
    |> assoc_constraint(:user)
    |> cast_assoc(:post)
    |> cast_assoc(:user)
  end
end

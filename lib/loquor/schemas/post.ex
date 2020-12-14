defmodule Loquor.Schemas.Post do
  use Loquor.Schema
  import Ecto.Changeset
  alias Loquor.Schemas.User
  alias Loquor.Schemas.Comment

  schema "posts" do
    field :title, :string
    field :content, :string

    belongs_to(:user, User)
    has_many(:comments, Comment)

    timestamps()
  end

  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :content, :user_id])
    |> validate_required([:content, :user_id])
    |> cast_assoc(:user)
    |> cast_assoc(:comments)
    |> assoc_constraint(:user)
  end
end

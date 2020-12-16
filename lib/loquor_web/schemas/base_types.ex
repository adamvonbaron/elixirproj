defmodule LoquorWeb.Schemas.BaseTypes do
  use Absinthe.Schema.Notation

  object :user do
    field :id, :id
    field :email, :string
    field :firstname, :string
    field :lastname, :string
    field :username, :string

    field :inserted_at, :date
  end

  object :post do
    field :id, :id
    field :title, :string
    field :content, :string
    field :inserted_at, :date

    field :author, :user do
      resolve(fn post, _, _ -> Loquor.Schemas.Post.get_author(post) end)
    end
  end
end

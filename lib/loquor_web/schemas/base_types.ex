defmodule LoquorWeb.Schemas.BaseTypes do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers

  object :user do
    field :id, :id
    field :email, :string
    field :firstname, :string
    field :lastname, :string
    field :username, :string

    field :inserted_at, :date
  end

  object :comment do
    field :id, :id
    field :content, :string
    field :inserted_at, :date

    field :author, :user do
      resolve(dataloader(Loquor.Schemas.User, :user, []))
    end
  end

  object :post do
    field :id, :id
    field :title, :string
    field :content, :string
    field :inserted_at, :date

    field :author, :user do
      resolve(dataloader(Loquor.Schemas.User, :user, []))
    end

    field :comments, list_of(:comment) do
      resolve(dataloader(Loquor.Schemas.Comment))
    end
  end
end

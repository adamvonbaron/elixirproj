defmodule LoquorWeb.Schemas.BaseTypes do
  use Absinthe.Schema.Notation

  object :user do
    field :id, :id
    field :email, :string
    field :firstname, :string
    field :lastname, :string
    field :username, :string
  end
end

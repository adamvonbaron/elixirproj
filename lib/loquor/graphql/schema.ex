defmodule Loquor.Graphql.Schema do
  use Absinthe.Schema
  import_types(Absinthe.Type.Custom)
  import_types(LoquorWeb.Schemas.BaseTypes)

  alias LoquorWeb.Resolvers

  query do
    @desc "gets all users"
    field :users, list_of(:user) do
      resolve(&Resolvers.User.list_users/3)
    end
  end
end

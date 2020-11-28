defmodule LoquorWeb.GraphQL.Schema do
  use Absinthe.Schema
  import_types(Absinthe.Type.Custom)

  alias LoquorWeb.GraphQL.Resolvers

  # @desc "get the data my man"
  # query do
  #   @desc "gets all users"
  #   field :users, list_of(:user) do
  #     resolve(&Resolvers.Accounts.list_users/3)
  #   end

  #   @desc "gets user by some param"
  #   field :user, :user do
  #     arg(:id, :id)
  #     arg(:username, :string)
  #     resolve(&Resolvers.Accounts.find_user/3)
  #   end
  # end

  # @desc "make some data my dude"
  # mutation do

  # end
end

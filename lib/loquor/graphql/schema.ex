defmodule Loquor.Graphql.Schema do
  use Absinthe.Schema
  import_types(Absinthe.Type.Custom)
  import_types(LoquorWeb.Schemas.BaseTypes)

  alias LoquorWeb.Resolvers
  alias Loquor.Schemas.{User, Post, Comment, Friendship}

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(User, User.datasource())
      |> Dataloader.add_source(Post, Post.datasource())
      |> Dataloader.add_source(Comment, Comment.datasource())
      |> Dataloader.add_source(Friendship, Friendship.datasource())
      |> Dataloader.run()

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader | Absinthe.Plugin.defaults()]
  end

  query do
    @desc "gets all users"
    field :users, list_of(:user) do
      resolve(&Resolvers.User.list_users/3)
    end

    @desc "gets all the posts"
    field :posts, list_of(:post) do
      resolve(&Resolvers.Post.list_posts/3)
    end
  end
end

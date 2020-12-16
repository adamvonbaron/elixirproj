defmodule LoquorWeb.Resolvers.Post do
  def list_posts(_parent, _args, _resolution) do
    {:ok, Loquor.Schemas.Post.list_posts()}
  end
end

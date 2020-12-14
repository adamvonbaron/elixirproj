defmodule LoquorWeb.Resolvers.User do
  def list_users(_parent, _args, _resolution) do
    {:ok, Loquor.Schemas.User.list_users()}
  end
end

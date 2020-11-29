defmodule Loquor.GuardianSerializer do
  @behaviour Guardian.Serializer

  alias Loquor.Repo
  alias Loquor.Schemas.User

  def for_token(user = %User{}), do: {:ok, user.id}
  def for_token(_), do: {:error, "unknown resource type"}

  def from_token(id) when is_binary(id), do: Repo.get(User, id)
  def from_token(_), do: {:error, "unknown resource type"}
end

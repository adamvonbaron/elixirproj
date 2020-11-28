defmodule Loquor.Guardian do
  use Guardian, otp_app: :loquor

  alias Loquor.Repo
  alias Loquor.Schemas.User

  def subject_for_token(resource, _claims) do
    {:ok, to_string(resource.id)}
  end

  def subject_for_token(_, _), do: {:error, :no_uuid_specified}

  def resource_for_claims(claims) do
    uuid = claims["sub"]
    user = Repo.find_by(User, id: uuid)
    {:ok, user}
  end

  def resource_for_claims(_claims) do
    {:error, :cant_find_user_with_uuid}
  end
end

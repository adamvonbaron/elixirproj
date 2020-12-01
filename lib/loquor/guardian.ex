defmodule Loquor.Guardian do
  use Guardian, otp_app: :loquor

  alias Loquor.Repo
  alias Loquor.Schemas.User

  def subject_for_token(resource, _claims) do
    {:ok, to_string(resource.id)}
  end

  def resource_from_claims(claims) do
    uuid = claims["sub"]
    user = Repo.get_by(User, id: uuid)
    {:ok, user}
  end
end

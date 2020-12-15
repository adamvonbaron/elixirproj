defmodule Loquor.Token do
  use Joken.Config

  def token_config() do
    default_claims(
      iss: "loquor",
      aud: "loquor"
    )
  end
end

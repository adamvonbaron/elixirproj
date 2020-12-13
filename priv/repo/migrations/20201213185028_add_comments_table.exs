defmodule Loquor.Repo.Migrations.AddCommentsTable do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :content, :text
      add :user_id, references(:users)
      add :post_id, references(:posts)

      timestamps()
    end
  end
end

defmodule Brainn.Repo.Migrations.CreateRepoTags do
  use Ecto.Migration

  def change do
    create table(:repo_tags) do
      add :tag_id, references(:tags)
      add :repo_id, references(:starred_repos)
    end

    create unique_index(:repo_tags, [:tag_id, :repo_id])
  end
end

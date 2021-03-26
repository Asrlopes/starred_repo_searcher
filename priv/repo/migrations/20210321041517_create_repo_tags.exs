defmodule Brainn.Repo.Migrations.CreateRepoTags do
  use Ecto.Migration

  def change do
    create table(:repo_tags) do
      add :tags_id, references(:tags)
      add :starred_repos_id, references(:starred_repos)

      timestamps()
    end

    create unique_index(:repo_tags, [:tags_id, :starred_repos_id])
  end
end

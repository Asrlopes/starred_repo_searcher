defmodule Brainn.Repo.Migrations.CreateRepoTags do
  use Ecto.Migration

  def change do
    create table(:repo_tags) do
      add :tags_id, references(:tags, on_delete: :delete_all)
      add :starred_repos_id, references(:starred_repos, on_delete: :delete_all)

      timestamps()
    end

    create unique_index(:repo_tags, [:tags_id, :starred_repos_id])
  end
end

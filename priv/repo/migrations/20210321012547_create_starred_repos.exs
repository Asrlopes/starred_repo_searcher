defmodule Brainn.Repo.Migrations.CreateStarredRepos do
  use Ecto.Migration

  def change do
    create table(:starred_repos, primary_key: false) do
      add :id, :integer, primary_key: true
      add :name, :string
      add :description, :string
      add :http_url, :string
      add :language, :string

      timestamps()
    end

  end
end

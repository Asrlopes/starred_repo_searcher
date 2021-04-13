defmodule BrainnWeb.RepositoriesView do
  use BrainnWeb, :view

  alias Brainn.StarredRepos
  alias BrainnWeb.RepositoriesView
  alias BrainnWeb.TagsView

  def render("index.json", %{repositories: repositories}) do
    %{data: render_many(repositories, RepositoriesView, "repositories.json")}
  end

  def render("repositories.json", %{
        repositories: %{} = repositories
      }) do
    %{
      id: repositories.id,
      name: repositories.name,
      description: repositories.description,
      language: repositories.language,
      http_url: repositories.http_url
    }
  end

  def render("repositories.json", %{
        repositories: %StarredRepos{} = starred_repos
      }) do
    %{
      id: starred_repos.id,
      name: starred_repos.name,
      description: starred_repos.description,
      language: starred_repos.language,
      http_url: starred_repos.http_url,
      tags: render_one(starred_repos.tags, TagsView, "index.json")
    }
  end
end

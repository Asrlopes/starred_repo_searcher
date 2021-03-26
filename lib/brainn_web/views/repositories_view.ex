defmodule BrainnWeb.RepositoriesView do
  use BrainnWeb, :view

  alias BrainnWeb.RepositoriesView

  def render("index.json", %{repositories: repositories}) do
    %{data: render_many(repositories, RepositoriesView, "repositories.json")}
  end

  def render("repositories.json", %{repositories: repositories}) do
    %{
      id: repositories.id,
      name: repositories.name,
      description: repositories.description,
      language: repositories.language,
      http_url: repositories.http_url,
      tags: repositories.tags
    }
  end
end

defmodule BrainnWeb.RepositoriesView do
  use BrainnWeb, :view

  alias BrainnWeb.RepositoriesView

  def render("index.json", %{repositories: repositories}) do
    %{data: render_many(repositories, RepositoriesView, "repositories.json")}
  end

  def render("repositories.json", %{
        repositories: %{
          "id" => id,
          "name" => name,
          "description" => description,
          "language" => language,
          "html_url" => html_url
        }
      }) do
    %{
      id: id,
      name: name,
      description: description,
      language: language,
      http_url: html_url
    }
  end
end

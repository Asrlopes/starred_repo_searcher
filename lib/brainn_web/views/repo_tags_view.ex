defmodule BrainnWeb.RepoTagsView do
  use BrainnWeb, :view

  def render("create.json", %{
        repository_tags: %{
          id: id,
          tags_id: tags_id,
          starred_repos_id: starred_repos_id,
          inserted_at: inserted_at,
          updated_at: updated_at
        }
      }) do
    %{
      id: id,
      starred_repos_id: starred_repos_id,
      tags_id: tags_id,
      inserted_at: inserted_at,
      updated_at: updated_at
    }
  end
end

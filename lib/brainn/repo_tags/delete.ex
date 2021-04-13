defmodule Brainn.RepoTags.Delete do
  alias Brainn.Repo
  alias Brainn.RepoTags

  def call(params) do
    params
    |> handle_delete()
  end

  defp handle_delete(%{"starred_repos_id" => starred_repos_id, "tags_id" => tags_id}) do
    Repo.get_by!(RepoTags, starred_repos_id: starred_repos_id, tags_id: tags_id)
    |> Repo.delete()
  rescue
    Ecto.NoResultsError ->
      {:error, "Resource not found"}
  end
end

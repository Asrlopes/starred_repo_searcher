defmodule BrainnWeb.RepoTagsController do
  use BrainnWeb, :controller
  alias Brainn.RepoTags

  action_fallback BrainnWeb.FallbackController

  def create(conn, params) do
    with {:ok, %RepoTags{} = repo_tags} <- Brainn.add_tags_to_repository(params) do
      conn
      |> put_status(:created)
      |> handle_response(repo_tags)
    end
  end

  defp handle_response(conn, %RepoTags{} = repo_tags) do
    conn
    |> render("create.json", repository_tags: repo_tags)
  end

  defp handle_response({:err, _reaseon}, _conn), do: :error
end

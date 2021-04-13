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

  def delete(conn, params) do
    Brainn.remove_tags_from_repository(params)
    |> handle_delete_response(conn)
  end

  defp handle_delete_response({:ok, %RepoTags{}}, conn), do: send_resp(conn, :no_content, "")
  defp handle_delete_response({:error, _reason} = error, _conn), do: error
end

defmodule BrainnWeb.RepositoriesController do
  use BrainnWeb, :controller

  action_fallback BrainnWeb.FallbackController

  def index(conn, %{"user" => user}) do
    user
    |> Brainn.fetch_starred_repositories()
    |> handle_response(conn)
  end

  defp handle_response({:ok, repositories}, conn) do
    conn
    |> put_status(:ok)
    |> render("index.json", repositories: repositories)
  end

  defp handle_response({:err, _reaseon}, _conn), do: :error
end

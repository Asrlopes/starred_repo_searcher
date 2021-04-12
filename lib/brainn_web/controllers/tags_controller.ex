defmodule BrainnWeb.TagsController do
  use BrainnWeb, :controller
  alias Brainn.Repo
  alias Brainn.Tags

  action_fallback BrainnWeb.FallbackController

  def index(conn, _params) do
    tags = Repo.all(Tags)

    conn
    |> put_status(:ok)
    |> render("index.json", %{tags: tags})
  end

  def create(conn, params) do
    with {:ok, %Tags{} = tags} <- Brainn.create_tags(params) do
      conn
      |> put_status(:created)
      |> handle_response(tags)
    end
  end

  defp handle_response(conn, %Brainn.Tags{} = tag) do
    conn
    |> render("create.json", tag: tag)
  end

  defp handle_response({:err, _reaseon}, _conn), do: :error

  def update(conn, params) do
    Brainn.update_tags(params)
    |> handle_update_response(conn)
  end

  defp handle_update_response({:ok, %Tags{} = tags}, conn) do
    conn
    |> put_status(:ok)
    |> render("create.json", tag: tags)
  end

  defp handle_update_response({:error, _reason} = error, _conn), do: error

  def delete(conn, params) do
    Brainn.delete_tags(params)
    |> handle_delete_response(conn)
  end

  defp handle_delete_response({:ok, %Tags{}}, conn), do: send_resp(conn, :no_content, "")
  defp handle_delete_response({:error, _reason} = error, _conn), do: error
end

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
    with {:ok, %Tags{} = tags} <- Brainn.update_tags(params) do
      conn
      |> put_status(:ok)
      |> render("create.json", tag: tags)
    end
  end

end

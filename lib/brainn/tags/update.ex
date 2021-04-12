defmodule Brainn.Tags.Update do
  alias Brainn.Repo
  alias Brainn.Tags

  def call(params) do
    params
    |> handle_update()
  end

  defp handle_update(%{"id" => id} = params) do
    with {:ok, %Tags{} = tag} <- get_tags!(id),
         {:ok, %Tags{} = tag} <- update_tag(tag, params) do
      {:ok, tag}
    end
  end

  def get_tags!(id) do
    {:ok, Repo.get!(Tags, id)}
  rescue
    Ecto.NoResultsError ->
      {:error, "Resource not found"}
  end

  def update_tag(%Tags{} = tag, attrs) do
    case Tags.update_changeset(attrs) do
      %Ecto.Changeset{valid?: true} ->
        tag
        |> Repo.preload([:starred_repos])
        |> Tags.changeset(attrs)
        |> Repo.update()

      e ->
        {:error, e}
    end
  end
end

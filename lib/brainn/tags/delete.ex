defmodule Brainn.Tags.Delete do
  alias Brainn.Repo
  alias Brainn.Tags

  def call(params) do
    params
    |> handle_delete()
  end

  defp handle_delete(%{"id" => id}) do
    Repo.get!(Tags, id)
    |> Repo.delete()

  rescue
    Ecto.NoResultsError ->
      {:error, "Resource not found"}
  end
end

defmodule Brainn.Tags.Create do
  alias Brainn.Repo
  alias Brainn.Tags

  def call(params) do
    Tags.changeset(params)
    |> Repo.insert()
  end
end

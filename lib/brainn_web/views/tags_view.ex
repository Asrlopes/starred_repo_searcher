defmodule BrainnWeb.TagsView do
  use BrainnWeb, :view
  alias BrainnWeb.TagsView

  def render("index.json", %{tags: tags}) do
    %{data: render_many(tags, TagsView, "tags.json")}
  end

  def render("tags.json", %{tags: tags}) do
    %{
      id: tags.id,
      name: tags.name,
      inserted_at: tags.inserted_at,
      updated_at: tags.updated_at
    }
  end

  def render("create.json", %{
        tag: %{id: id, name: name, inserted_at: inserted_at, updated_at: updated_at}
      }) do
    %{
      id: id,
      name: name,
      inserted_at: inserted_at,
      updated_at: updated_at
    }
  end
end

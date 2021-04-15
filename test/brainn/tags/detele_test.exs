defmodule Brainn.Tags.DeleteTest do
  use Brainn.DataCase, async: true

  alias Brainn.Tags
  alias Brainn.Tags.Create
  alias Brainn.Tags.Delete

  describe "call/1" do
    test "when the given id is valid, deletes chosen tag" do
      params = %{
        name: "docker"
      }

      {:ok, %Tags{id: tag_id}} = Create.call(params)

      {:ok, %Tags{}} = Delete.call(%{"id" => tag_id})
    end
  end
end

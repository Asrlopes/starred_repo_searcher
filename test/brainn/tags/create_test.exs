defmodule Brainn.Tags.CreateTest do
  use Brainn.DataCase, async: true

  alias Brainn.Tags
  alias Brainn.Tags.Create

  describe "call/1" do
    test "when all params are valid, returns an tag" do
      params = %{
        name: "docker"
      }

      {:ok, %Tags{id: tag_id}} = Create.call(params)
      tag = Repo.get(Tags, tag_id)

      assert %Tags{name: "docker", id: ^tag_id} = tag
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: ""
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{
        name: ["can't be blank"]
      }

      assert errors_on(changeset) == expected_response
    end
  end
end

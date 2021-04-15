defmodule Brainn.Tags.UpdateTest do
  use Brainn.DataCase, async: true

  alias Brainn.Tags
  alias Brainn.Tags.Create
  alias Brainn.Tags.Update

  describe "call/1" do
    test "when all params are valid, update an tag" do
      params = %{
        name: "docker"
      }

      {:ok, %Tags{id: tag_id}} = Create.call(params)

      update_params = %{
        "id" => tag_id,
        "name" => "kubernets"
      }

      {:ok, %Tags{id: tag_id}} = Update.call(update_params)
      tag = Repo.get(Tags, tag_id)

      assert %Tags{name: "kubernets", id: ^tag_id} = tag
    end
  end

  test "when the given id does not exist, show an error message" do
    params = %{
      name: "docker"
    }

    {:ok, %Tags{}} = Create.call(params)

    update_params = %{
      "id" => 999_999,
      "name" => "kubernets"
    }

    tag = Update.call(update_params)

    assert {:error, "Resource not found"} = tag
  end
end

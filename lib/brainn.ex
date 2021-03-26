defmodule Brainn do
  alias Brainn.Repositories

  defdelegate fetch_starred_repositories(params), to: Repositories.Get, as: :call
end

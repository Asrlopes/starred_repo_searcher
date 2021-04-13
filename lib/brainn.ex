defmodule Brainn do
  alias Brainn.{Repositories, RepoTags, Tags}

  defdelegate fetch_starred_repositories(params), to: Repositories.Get, as: :call
  defdelegate list_starred_repositories(), to: Repositories.Get, as: :call

  defdelegate create_tags(params), to: Tags.Create, as: :call
  defdelegate update_tags(params), to: Tags.Update, as: :call
  defdelegate delete_tags(params), to: Tags.Delete, as: :call

  defdelegate add_tags_to_repository(params), to: RepoTags.Create, as: :call
  defdelegate remove_tags_from_repository(params), to: RepoTags.Delete, as: :call
end

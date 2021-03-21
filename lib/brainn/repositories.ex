defmodule Brainn.Repositories do
  @moduledoc """
  The Repositories context.
  """

  import Ecto.Query, warn: false
  alias Brainn.Repo

  alias Brainn.Repositories.Repos

  @doc """
  Returns the list of starred_repos.

  ## Examples

      iex> list_starred_repos()
      [%Repos{}, ...]

  """
  def list_starred_repos do
    Repo.all(Repos)
  end

  @doc """
  Gets a single repos.

  Raises `Ecto.NoResultsError` if the Repos does not exist.

  ## Examples

      iex> get_repos!(123)
      %Repos{}

      iex> get_repos!(456)
      ** (Ecto.NoResultsError)

  """
  def get_repos!(id), do: Repo.get!(Repos, id)

  @doc """
  Creates a repos.

  ## Examples

      iex> create_repos(%{field: value})
      {:ok, %Repos{}}

      iex> create_repos(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_repos(attrs \\ %{}) do
    %Repos{}
    |> Repos.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a repos.

  ## Examples

      iex> update_repos(repos, %{field: new_value})
      {:ok, %Repos{}}

      iex> update_repos(repos, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_repos(%Repos{} = repos, attrs) do
    repos
    |> Repos.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a repos.

  ## Examples

      iex> delete_repos(repos)
      {:ok, %Repos{}}

      iex> delete_repos(repos)
      {:error, %Ecto.Changeset{}}

  """
  def delete_repos(%Repos{} = repos) do
    Repo.delete(repos)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking repos changes.

  ## Examples

      iex> change_repos(repos)
      %Ecto.Changeset{data: %Repos{}}

  """
  def change_repos(%Repos{} = repos, attrs \\ %{}) do
    Repos.changeset(repos, attrs)
  end
end

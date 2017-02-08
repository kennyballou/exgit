defmodule Exgit.Escript do
  @moduledoc """
  Escript entry point for Exgit
  """

  @doc """
  Main entry for Exgit

    iex> main([])
    :error
  """
  @spec main(List.t) :: binary | :error | {:error, binary}
  def main([]) do
    {:error, "Missing Argument"}
  end

  @doc """
  Main entry for Exgit

    iex> main(["test.pack"])
    {:error, "test.pack"}
  """
  def main(args) when is_list(args) do
    args
    |> hd()
    |> parse_packfile()
    |> inspect()
    |> IO.puts
  end

  @doc """
  Parse the provided packfile and display its contents

    iex> parse_packfile("0011223344.pack")
    {:error, "0011223344.pack"}
  """
  @spec parse_packfile(binary) :: {:ok, binary} | {:error, binary}
  def parse_packfile(packfile) do
    {:error, packfile}
  end

end

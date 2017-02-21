defmodule Exgit.Packfile do
  @moduledoc """
  Module for parsing Git Packfiles
  """

  @spec parse_header(binary) :: {:pack, 2|3, integer}
  def parse_header(packfile) do
    <<"PACK" :: utf8, 2 :: size(32), n :: size(32)>> <> rest = packfile
    {:pack, 2, n, rest}
  end

  @spec parse_objects(integer, binary) :: [{:commit|:blob|:tree,
                                            binary,
                                            binary}]
  def parse_objects(n, pack) do
    pack |> IO.inspect
  end

  defp parse_object(data) do
    <<type :: size(4), _>> = data
  end
end

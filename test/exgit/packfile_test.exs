defmodule Exgit.Packfile.Test do
  use ExUnit.Case
  import Exgit.Packfile

  doctest Exgit.Packfile

  @fixtures_dir "test/fixtures/packfiles/"

  describe "can parse header information" do
    test "header with version 2" do
      filename = Path.join(@fixtures_dir, "pack-simple.pack")
      packfile = File.read!(filename)
      assert {:pack, 2, 3, _} = parse_header(packfile)
    end
  end

  describe "parse objects from pack" do
    test "can return all objects from pack" do
      filename = Path.join(@fixtures_dir, "pack-simple.pack")
      packfile = File.read!(filename)
      {:pack, 2, 3, rest} = parse_header(packfile)
      assert [{:commit, "ca5bae75ae512b3e3a3d86f6009452d24cc3873f", },
              {:blob, "e69de29bb2d1d6434b8b29ae775ad8c2e48c5391", _},
              {:tree, "4d5fcadc293a348e88f777dc0920f11e7d71441c", _}] =
             parse_objects(3, rest)
    end
  end
end

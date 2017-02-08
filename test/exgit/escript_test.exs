defmodule Exgit.Escript.Test do
  use ExUnit.Case
  import Exgit.Escript

  doctest Exgit.Escript

  test "main with arguments returns error" do
    assert {:error, "test.pack"} == main(["test.pack"])
  end

end

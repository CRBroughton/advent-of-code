defmodule AdventofcodeTest do
  use ExUnit.Case
  doctest Adventofcode

  test "Returns the Elf carrying the most calories" do
    elfs = [[1000, 2000, 3000], [4000], [5000, 6000], [7000, 8000, 9000], [10000]]
    assert Adventofcode.findHighestCalorieElf(elfs) === 24000
  end
end

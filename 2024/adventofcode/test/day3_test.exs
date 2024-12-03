defmodule Day3Test do
  use ExUnit.Case
  doctest Day3

  test "Extracts the valid calculations from the input" do
    input = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
    assert Day3.extractValidCalculations(input) === [[2, 4], [5, 5], [11, 8], [8, 5]]
  end

  test "Calculates the total of valid calculations" do
    input = [[2, 4], [5, 5], [11, 8], [8, 5]]
    assert Day3.calculateTotal(input) === 161
  end

  test "Gets the correct total for part 1" do
    assert Day3.result() === 1
  end
end

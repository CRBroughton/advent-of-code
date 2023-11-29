defmodule Adventofcode do
  @moduledoc """
  Documentation for `Adventofcode`.
  """
  @spec findHighestCalorieElf(list(list(integer()))) :: integer()
  def findHighestCalorieElf(elfs) do
    sums = Enum.map(elfs, fn elf ->
      Enum.sum(elf)
    end)

    Enum.max(sums)
  end
end

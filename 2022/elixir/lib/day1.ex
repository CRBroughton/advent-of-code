defmodule Day1 do
  @moduledoc """
  Documentation for `Adventofcode`.
  """
  def sanitizeElfs(elfs) do
    elfs
    |> String.split("\n\n")
    |> Enum.map(&sumAnElfsFoodCaloryCount(&1))
  end

  def findHighestCalorieElf(elfs) do
    elfs
    |> sanitizeElfs()
    |> Enum.max()
  end

  def findHighestCalorieElf(elfs, count) do
    elfs
    |> sanitizeElfs()
    |> Enum.sort()
    |> Enum.take(count)
    |> IO.inspect()
    |> Enum.sum()
  end

  defp sumAnElfsFoodCaloryCount(elf) do
    elf
    |> String.split("\n", trim: true)
    |> Enum.map(&(String.to_integer(&1)))
    |> Enum.sum()
  end
end

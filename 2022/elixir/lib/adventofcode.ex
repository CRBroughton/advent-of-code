defmodule Adventofcode do
  @moduledoc """
  Documentation for `Adventofcode`.
  """
  def findHighestCalorieElf(elfs) do
    elfs
    |> String.split("\n\n")
    |> Enum.map(&sumAnElfsFoodCaloryCount(&1))
    |> Enum.max()
  end

  defp sumAnElfsFoodCaloryCount(elf) do
    elf
    |> String.split("\n", trim: true)
    |> Enum.map(&(String.to_integer(&1)))
    |> Enum.sum()
  end
end

defmodule Day2 do
  def sanitizeRounds(rounds) do
    rounds
    |> String.split("\n", trim: true)
  end

  def getRoundResult(rounds) do
    rounds
    |> sanitizeRounds()
    |> Enum.map(&fight(&1))
    |> Enum.sum()
  end

  def getFixedMatchResults(rounds) do
    rounds
    |> sanitizeRounds()
    |> Enum.map(&fixTheMatch(&1))
    |> IO.inspect()
    |> Enum.map(&fight(&1))
    |> Enum.sum()
  end

  def fight(round) do
    case round do
      "A Y" -> 6 + 2
      "A X" -> 3 + 1
      "A Z" -> 0 + 3
      "B X" -> 0 + 1
      "B Y" -> 3 + 2
      "B Z" -> 6 + 3
      "C X" -> 6 + 1
      "C Y" -> 0 + 2
      "C Z" -> 3 + 3
      _ -> 0
    end
  end

  def fixTheMatch(round) do
    case round do
      "A Y" -> "A X"
      "A X" -> "A Z"
      "A Z" -> "A Y"
      "B Y" -> "B Y"
      "B X" -> "B X"
      "B Z" -> "B Z"
      "C Y" -> "C Z"
      "C X" -> "C Y"
      "C Z" -> "C X"
      _ -> ""
    end
  end
end

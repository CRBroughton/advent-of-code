defmodule Day2 do
  def sanitizeRounds(rounds) do
    rounds
    |> String.split("\n", trim: true)
  end

  def getRoundResult(rounds) do
    fightResults = rounds
    |> sanitizeRounds()
    |> Enum.map(&fight(&1))
    |> Enum.sum()

    shapeResults = rounds
    |> sanitizeRounds()
    |> Enum.map(&getPlayerShape(&1))
    |> Enum.sum()

    Enum.sum([fightResults, shapeResults])
  end

  def getFixedMatchResults(rounds) do
    fightResults = rounds
    |> sanitizeRounds()
    |> Enum.map(&fixTheMatch(&1))
    |> IO.inspect()
    |> Enum.map(&fight(&1))
    |> Enum.sum()

    shapeResults = rounds
    |> sanitizeRounds()
    |> Enum.map(&fixTheMatch(&1))
    |> Enum.map(&getPlayerShape(&1))
    |> Enum.sum()

    Enum.sum([fightResults, shapeResults])
  end

  def fight(round) do
    case round do
      # OPP - A = ROCK, B = PAPER = C SICSSORS
      # PLAYER - X = ROCK, Y = PAPER, Z = SICSSORS
      # CONDITIONS - LOSE = 0, DRAW = 1, WIN = 6
      "A X" -> 3
      "A Y" -> 6
      "A Z" -> 0
      "B X" -> 0
      "B Y" -> 3
      "B Z" -> 6
      "C X" -> 6
      "C Y" -> 0
      "C Z" -> 3
      _ -> 0
    end
  end

  def getPlayerShape(round) do
    case round do
      "A Y" -> 2
      "A X" -> 1
      "A Z" -> 3
      "B Y" -> 2
      "B X" -> 1
      "B Z" -> 3
      "C Y" -> 2
      "C X" -> 1
      "C Z" -> 3
      _ -> 0
    end
  end

  def fixTheMatch(round) do
    # X = LOSE, Y = DRAW, Z = WIN
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

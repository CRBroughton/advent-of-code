defmodule Day1 do
  def sanitizeRounds(rounds) do
    rounds
    |> String.split("\n", trim: true)
  end

  @spec splitStringToChars(String.t()) :: [String.grapheme()]
  def splitStringToChars(list) do
    list
    |> String.graphemes()
  end

  def getPairOfNumbers(list) do
    result =
      Enum.map(list, fn char ->
        case Integer.parse(char) do
          {_, ""} -> char
          _ -> ""
        end
      end)
      |> Enum.reject(fn char -> char == "" end)

    [List.first(result), List.last(result)]
    |> Enum.join()
    |> String.to_integer()
  end

  def sumTheValues(input) do
    input
    |> sanitizeRounds()
    |> Enum.map(fn line ->
      splitStringToChars(line)
      |> getPairOfNumbers()
    end)
    |> Enum.sum()
  end
end

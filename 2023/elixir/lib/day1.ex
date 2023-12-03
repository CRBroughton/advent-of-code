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

  def matchStringToInt(number) do
    case number do
      "one" -> 1
      "two" -> 2
      "three" -> 3
      "four" -> 4
      "five" -> 5
      "six" -> 6
      "seven" -> 7
      "eight" -> 8
      "nine" -> 9
      _ -> {value, _} = Integer.parse(number)
      value
    end
  end

  def sumTheSingleStringValues(input) do
    regex = ~r"(?=(\d|one|two|three|four|five|six|seven|eight|nine))"

    numList =
      Regex.scan(regex, input)
      |> Enum.map(&List.last/1)
      |> List.flatten()

    Enum.join([List.first(numList) |> matchStringToInt(), List.last(numList) |> matchStringToInt()])
    |> String.to_integer()
  end

  def sumTheStringValues(input) do
    input
    |> sanitizeRounds()
    |> Enum.map(fn line ->
      sumTheSingleStringValues(line)
    end)
    |> Enum.sum()
  end
end

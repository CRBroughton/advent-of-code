defmodule Day3 do
  @spec extractValidCalculations(binary()) :: list((list(number())))
  def extractValidCalculations(input) do
    Regex.scan(~r/mul\((\d+),(\d+)\)/, input)
    |> Enum.map(fn [_full, n1, n2] -> [String.to_integer(n1), String.to_integer(n2)] end)
  end

  def calculateTotal(calculations) do
    calculations
    |> Enum.map(fn [a, b] -> a * b end)
    |> Enum.sum()
  end

  def readFile(path) do
    case File.read(path) do
      {:ok, content} -> content
      {:error, reason} -> raise "Failed to read the file: #{reason}"
    end
  end

  def result() do
    content = readFile("data/day3Part1.txt")
    extractValidCalculations(content)
    |> calculateTotal()
  end
end

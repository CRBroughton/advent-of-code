defmodule Day4 do
  def createCharacterGridAndGridSize(input) do
    rows =
      input
      |> String.trim()
      |> String.split("\n", trim: true)

    gridSize = length(rows)
    {rows, gridSize}
  end

  def isMSString(first, second) do
    combined = first <> second
    combined == "MS" || combined == "SM"
  end

  def count_all_xmas(input) do
    {rows, _} = createCharacterGridAndGridSize(input)
    height = length(rows)
    width = String.length(Enum.at(rows, 0))

    Enum.count(
      for row <- 1..(height - 2),
          column <- 1..(width - 2),
          String.at(Enum.at(rows, row), column) == "A",
          isMSString(
            String.at(Enum.at(rows, row - 1), column - 1),
            String.at(Enum.at(rows, row + 1), column + 1)
          ),
          isMSString(
            String.at(Enum.at(rows, row + 1), column - 1),
            String.at(Enum.at(rows, row - 1), column + 1)
          ),
          do: {column, row}
    )
  end
end

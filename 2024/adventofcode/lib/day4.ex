defmodule Day4 do
  def createCharacterGridAndGridSize(input) do
    rows = String.split(input, "\n", trim: true)
    gridSize = length(rows)

    rows
    |> Enum.map(&String.graphemes/1)

    {rows, gridSize}
  end

  def getStartingPositions(gridSize) do
    for row_index <- 0..(gridSize - 1),
        column_index <- 0..(gridSize - 1),
        do: {row_index, column_index}
  end

  def getGridDirections do
    [
      {0, 1},    # right
      {0, -1},   # left
      {1, 0},    # down
      {-1, 0},   # up
      {1, 1},    # down-right
      {-1, -1},  # up-left
      {1, -1},   # down-left
      {-1, 1}    # up-right
    ]
  end

  def checkPosition(grid, {row_index, column_index}, {row_direction, column_direction}) do
    grid_size = length(grid)

    characters = for step <- 0..3 do
      next_row = row_index + step * row_direction
      next_column = column_index + step * column_direction

      if next_row >= 0 and next_row < grid_size and
         next_column >= 0 and next_column < grid_size do
          grid |> Enum.at(next_row) |> Enum.at(next_column)
      end
    end

    characters == ["X", "M", "A", "S"]
  end

  def count_all_xmas(input) do
    {character_grid, grid_size} = createCharacterGridAndGridSize(input)
    starting_positions = getStartingPositions(grid_size)
    search_directions = getGridDirections()

    starting_positions
    |> Enum.flat_map(fn position ->
      search_directions
      |> Enum.filter(fn direction ->
        checkPosition(character_grid, position, direction)
      end)
      |> Enum.map(fn _direction -> position end)
    end)
    |> length()
  end

end

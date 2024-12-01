defmodule Day1 do
  @type integer_tuple :: {integer(), integer()}

  @spec createTupleList(String.t()) :: list({integer(), integer()})
  def createTupleList(input) do
    lines = String.split(input, "\n", trim: true)

    {lefts, rights} = Enum.map(lines, fn line ->
      [left, right] = String.split(line)
      {String.to_integer(left), String.to_integer(right)}
    end)
    |> Enum.unzip()
    Enum.zip(Enum.sort(lefts), Enum.sort(rights))
  end

  @spec sumUpDifference(list({integer(), integer()})) :: integer()
  def sumUpDifference(list) do
    differences = Enum.map(list, fn {left, right} ->
      abs(left - right)
    end)
    Enum.sum(differences)
  end

  @spec result(binary()) :: integer()
  def result(input) do
    createTupleList(input)
    |> sumUpDifference()
  end
end

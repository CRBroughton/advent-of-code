defmodule Day1 do
  @type integer_tuple :: {integer(), integer()}

  @spec createTupleList(String.t()) :: list({integer(), integer()})
  def createTupleList(input) do
    lines = String.split(input, "\n", trim: true)

    {lefts, rights} = Enum.map(lines, fn line ->
      [left, right] = String.split(line)
        getNumbers(left, right)
    end)
    |> Enum.unzip()
    Enum.zip(Enum.sort(lefts), Enum.sort(rights))
  end

  @spec getNumbers(String.t(), String.t()) :: {integer(), integer()}
  def getNumbers(first, second) do
    {String.to_integer(first), String.to_integer(second)}
  end

  @spec getDifference(integer_tuple()) :: number()
  def getDifference(input) do
    abs(elem(input, 0) - elem(input, 1))
  end

  @spec sumUpDifference(list({integer(), integer()})) :: integer()
  def sumUpDifference(list) do
    differences = Enum.map(list, fn {left, right} ->
      getDifference({left, right})
    end)
    Enum.sum(differences)
  end

  @spec result(binary()) :: integer()
  def result(input) do
    createTupleList(input)
    |> sumUpDifference()
  end
end

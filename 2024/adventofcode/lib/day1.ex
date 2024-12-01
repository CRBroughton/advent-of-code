defmodule Day1 do
  @type integer_tuple :: {integer(), integer()}


  @spec createLists(String.t()) :: {list(), list()}
  def createLists(input) do
    lines = String.split(input, "\n", trim: true)

    {lefts, rights} = Enum.map(lines, fn line ->
      [left, right] = String.split(line)
      {String.to_integer(left), String.to_integer(right)}
    end)
    |> Enum.unzip()
    {lefts, rights}
  end

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

  @spec sumUpSimilarities(String.t()) :: number()
  def sumUpSimilarities(input) do
    {lefts, rights} = createLists(input)
    frequencies = Enum.frequencies(rights)

    Enum.map(lefts, fn number ->
      number * Map.get(frequencies, number, 0)
    end)
    |> Enum.sum()
  end

  @spec result(binary()) :: integer()
  def result(input) do
    createTupleList(input)
    |> sumUpDifference()
  end
end

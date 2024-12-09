defmodule Day5 do
  def splitRulesAndUpdates(input) do
    [rules, updates] = String.trim(input) |> String.split("\n\n", trim: true)

    {String.split(rules, "\n", trim: true), String.split(updates, "\n", trim: true)}
  end

  def createRulesMapSet(input) do
    Enum.map(input, fn line ->
      [from, to] =
        String.split(line, "|")
        |> Enum.map(&String.to_integer/1)

      {from, to}
    end)
    |> MapSet.new()
  end

  def createUpdatesArray(input) do
    Enum.map(input, fn line ->
      String.split(line, ",") |> Enum.map(fn num -> String.to_integer(String.trim(num)) end)
    end)
  end

  def getMiddleNumber(input) do
    middleIndex = div(length(input), 2)
    Enum.at(input, middleIndex)
  end

  def isValidOrder?(rules, update) do
    update
    |> Enum.with_index()
    |> Enum.all?(fn {number1, index1} ->
      Enum.with_index(update)
      |> Enum.all?(fn {number2, index2} ->
        if MapSet.member?(rules, {number2, number1}) do
          index2 < index1
        else
          true
        end
      end)
    end)
  end

  def result(input) do
    {rules, updates} = splitRulesAndUpdates(input)
    rules = createRulesMapSet(rules)
    updates = createUpdatesArray(updates)

    updates
    |> Enum.filter(&isValidOrder?(rules, &1))
    |> Enum.map(&getMiddleNumber/1)
    |> Enum.sum()
  end
end

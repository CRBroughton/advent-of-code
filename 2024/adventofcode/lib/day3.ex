defmodule Day3 do
  defmodule State do
    defstruct enabled: true, calculations: [], operations: []
  end

  def extractValidCalculations(input) do
    operations =
      Regex.scan(~r/(?:do\(\)|don't\(\)|mul\(\d+,\d+\))/, input)
      |> List.flatten()

    state = %State{operations: operations}
    calulatorProcessor(state)
  end

  def calulatorProcessor(%State{operations: []} = state) do
    Enum.reverse(state.calculations)
  end

  def calulatorProcessor(%State{operations: [operation | rest]} = state) do
    case operation do
      "do()" ->
        calulatorProcessor(%{state | operations: rest, enabled: true})
      "don't()" ->
        calulatorProcessor(%{state | operations: rest, enabled: false})
      multiOperation when is_binary(multiOperation) ->
        if state.enabled and String.starts_with?(multiOperation, "mul") do
          numbers =
            Regex.scan(~r/\d+/, multiOperation)
            |> List.flatten()
            |> Enum.map(&String.to_integer/1)

          new_calculations = [[Enum.at(numbers, 0), Enum.at(numbers, 1)] | state.calculations]
          calulatorProcessor(%{state | operations: rest, calculations: new_calculations})
        else
          calulatorProcessor(%{state | operations: rest})
        end
    end
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

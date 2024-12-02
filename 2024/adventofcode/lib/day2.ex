defmodule Day2 do
  @spec createReportArrays(binary()) :: list(number())
  def createReportArrays(input) do
    String.split(input, "\n", trim: true)
    |> Enum.map(fn row ->
      String.split(row, " ")
      |> Enum.map(&String.to_integer/1)
    end)
  end

  @spec checkMonotonicGuard(list(number())) :: {:ok, boolean()}
  def checkMonotonicGuard(report) do
    pairs = Enum.chunk_every(report, 2, 1, :discard)

    allIncreasing = Enum.all?(pairs, fn [a, b] -> b < a end)
    allDecreasing = Enum.all?(pairs, fn [a, b] -> b > a end)

    {:ok, allIncreasing || allDecreasing}
  end

  @spec checkAdjacencyGuard(list(number())) :: {:ok, boolean()}
  def checkAdjacencyGuard(report) do
    guardResults =
      report
      |> Enum.chunk_every(2, 1, :discard)
      |> Enum.map(fn [previous, current] ->
        difference = abs(current - previous)
        difference >= 1 && difference <= 3
      end)

    results = [true | guardResults]
    allAreValid = Enum.all?(results, & &1)

    {:ok, allAreValid}
  end

  @spec isReportSafe([number()]) :: boolean()
  def isReportSafe(report) do
    {:ok, monotonic_valid} = checkMonotonicGuard(report)
    {:ok, adjacency_valid} = checkAdjacencyGuard(report)

    monotonic_valid && adjacency_valid
  end

  @spec result(binary()) :: non_neg_integer()
  def result(input) do
    createReportArrays(input)
    |> Enum.count(fn report ->
      if isReportSafe(report) do
        true
      else
        0..(length(report) - 1)
        |> Enum.any?(fn index ->
          dampenedReport = List.delete_at(report, index)
          isReportSafe(dampenedReport)
        end)
      end
    end)
  end
end

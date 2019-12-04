defmodule SecureContainer do
  def part1(range) do
    range
    |> Stream.map(&Integer.to_string/1)
    # needed to chunk the string in the next steps
    |> Stream.map(&String.codepoints/1)
    |> Stream.map(&Stream.chunk_every(&1, 2, 1, :discard))
    |> Stream.filter(&has_two_adjacent_digits?(&1))
    |> Enum.count(&incrementing?(&1))
  end

  defp has_two_adjacent_digits?(chunks), do: Enum.any?(chunks, fn [a, b] -> a == b end)

  defp incrementing?(chunks), do: Enum.all?(chunks, fn [a, b] -> a <= b end)
end

range = 172_930..683_082

IO.inspect("Part1 answer: #{SecureContainer.part1(range)}")
# Part1 Answer: 1675

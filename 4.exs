defmodule ProgramAlarm do
  def substitute_element(list, [operation, position1, position2, save_destination]) do
    elem1 = Enum.at(list, position1)
    elem2 = Enum.at(list, position2)

    new_element =
      case operation do
        1 -> elem1 + elem2
        2 -> elem1 * elem2
      end

    List.replace_at(list, save_destination, new_element)
  end

  def process(list, [99 | _]), do: list

  def process(list, [operation, position1, position2, save_destination | tail]) do
    process(substitute_element(list, [operation, position1, position2, save_destination]), tail)
  end

  def process(list), do: process(list, list)
end

# tests
# data = [1, 9, 10, 3, 2, 3, 11, 0, 99, 30, 40, 50]
# answer = [3500, 9, 10, 70, 2, 3, 11, 0, 99, 30, 40, 50]
# IO.inspect(answer === ProgramAlarm.process(data))
# data = [1,0,0,0,99]
# answer = [2,0,0,0,99]
# IO.inspect(answer === ProgramAlarm.process(data))
# data = [2,3,0,3,99]
# answer = [2,3,0,6,99]
# IO.inspect(answer === ProgramAlarm.process(data))
# data = [2,4,4,5,99,0]
# answer = [2,4,4,5,99,9801]
# IO.inspect(answer === ProgramAlarm.process(data))
# data = [1,1,1,4,99,5,6,0,99]
# answer = [30,1,1,4,2,5,6,0,99]
# IO.inspect(answer === ProgramAlarm.process(data))
# This last one fails because in the `process` function tail is taken before the new list is generated.
# In the prev run `substitute_element` changes part of the tai(changes one of the next 4 elements) to create a new array
# but we took the tail before. So this old tail does not have latest values

raw_data = [
  1,
  0,
  0,
  3,
  1,
  1,
  2,
  3,
  1,
  3,
  4,
  3,
  1,
  5,
  0,
  3,
  2,
  6,
  1,
  19,
  1,
  19,
  9,
  23,
  1,
  23,
  9,
  27,
  1,
  10,
  27,
  31,
  1,
  13,
  31,
  35,
  1,
  35,
  10,
  39,
  2,
  39,
  9,
  43,
  1,
  43,
  13,
  47,
  1,
  5,
  47,
  51,
  1,
  6,
  51,
  55,
  1,
  13,
  55,
  59,
  1,
  59,
  6,
  63,
  1,
  63,
  10,
  67,
  2,
  67,
  6,
  71,
  1,
  71,
  5,
  75,
  2,
  75,
  10,
  79,
  1,
  79,
  6,
  83,
  1,
  83,
  5,
  87,
  1,
  87,
  6,
  91,
  1,
  91,
  13,
  95,
  1,
  95,
  6,
  99,
  2,
  99,
  10,
  103,
  1,
  103,
  6,
  107,
  2,
  6,
  107,
  111,
  1,
  13,
  111,
  115,
  2,
  115,
  10,
  119,
  1,
  119,
  5,
  123,
  2,
  10,
  123,
  127,
  2,
  127,
  9,
  131,
  1,
  5,
  131,
  135,
  2,
  10,
  135,
  139,
  2,
  139,
  9,
  143,
  1,
  143,
  2,
  147,
  1,
  5,
  147,
  0,
  99,
  2,
  0,
  14,
  0
]

possible_values = 0..99

for a <- possible_values, b <- possible_values do
  [head | _] =
    raw_data
    |> List.replace_at(1, a)
    |> List.replace_at(2, b)
    |> ProgramAlarm.process()

  try do
    if head == 19_690_720, do: throw(:break)
  catch
    :break -> IO.inspect(100 * a + b)
  end
end

# answer 7603
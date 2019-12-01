defmodule FuelCalculator do
    # def calc_fuel(fuel, acc \\ 0)

    # <=6 because div(6, 3) - 2 = 0
    def calc_fuel(fuel) when fuel <=6, do: 0

    def calc_fuel(fuel), do: calc_fuel_for_mass(fuel) + calc_fuel(calc_fuel_for_mass(fuel))

    def calc_fuel_for_mass(mass), do: div(mass, 3) - 2
end

IO.inspect FuelCalculator.calc_fuel 1969
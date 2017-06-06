require './lib/recipe'

class Pantry
  attr_accessor :stock,
                :total,
                :output

  def initialize
    @stock = Hash.new(0)
    @total = Array.new
    @output = Hash.new
  end

  def stock_check(item)
    @stock[item]
  end

  def quantity(amount)
    @total << amount
    sum = total.reduce(:+)
  end

  def restock(item, amount)
    @stock[item] = quantity(amount)
  end

  def convert_units(recipe)
    recipe.ingredients.map do |name, amount|
      if amount > 100
        to_centi_units(name, amount)
      elsif amount < 1
        to_milli_units(name, amount)
      else
        @output[name] = {quantity: amount, units: "Universal Units"}
      end
    end
    @output
  end

  def to_centi_units(name, amount)
    new_amount = (amount / 100).to_i
    @output[name] = {quantity: new_amount, units: "Centi-Units"}
  end

  def to_milli_units(name, amount)
    new_amount = (amount * 1000).to_i
    @output[name] = {quantity: new_amount, units: "Milli-Units"}
  end

end

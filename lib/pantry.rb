require './lib/recipe'

class Pantry
  attr_accessor :stock,
              :total

  def initialize
    @stock = Hash.new(0)
    @total = Array.new
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
    recipe.ingredients.keys.map do |name|
      if ingredients[name] > 100 "Centi-Units"
      elsif ingredients[name] < 1 "Milli-Units"
      else
        amount units = "Universal Units"
  end

end

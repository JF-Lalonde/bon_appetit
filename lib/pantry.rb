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


end

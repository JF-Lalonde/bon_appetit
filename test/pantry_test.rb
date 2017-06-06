require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test

  def test_pantry_exists
    pantry = Pantry.new
    actual = pantry

    assert_instance_of Pantry, pantry
  end
  def test_stock_is_empty_hash
    pantry = Pantry.new
    actual = pantry.stock.class
    assert_equal Hash, actual
  end

  def test_stock_check_starts_at_zero
    pantry = Pantry.new
    actual = pantry.stock_check("Cheese")

    assert_equal 0, actual
  end

  def test_restock_adds_amount
    pantry = Pantry.new
    pantry.restock("Cheese", 10)
    actual = pantry.stock_check("Cheese")

    assert_equal 10, actual
  end

  def test_values_add_up
    pantry = Pantry.new
    pantry.restock("Cheese", 10)
    pantry.restock("Cheese", 20)
    actual = pantry.stock_check("Cheese")

    assert_equal 30, actual
  end

  
end

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

  def test_quantity_method
    pantry = Pantry.new
    actual = pantry.quantity(40)

    assert_equal 40, actual
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

  def test_unit_conversion
    r = Recipe.new("Spicy Cheese Pizza")
    r.add_ingredient("Cayenne Pepper", 0.025)
    r.add_ingredient("Cheese", 75)
    r.add_ingredient("Flour", 500)
    actual = r.ingredient_types

    assert_equal Recipe, r.class
    assert_equal ["Cayenne Pepper", "Cheese", "Flour"], actual

    pantry = Pantry.new
    actual = pantry.convert_units(r)
    expected = {"Cayenne Pepper" => {quantity: 25, units: "Milli-Units"},
    "Cheese"         => {quantity: 75, units: "Universal Units"},
    "Flour"          => {quantity: 5, units: "Centi-Units"}}

    assert_equal expected, actual
  end

  def test_add_to_shopping_list_method
    pantry = Pantry.new
    r = Recipe.new("Cheese Pizza")
    r.ingredients
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)
    r.ingredients
    actual = r.ingredients.keys.count

    assert_equal 2, actual

    pantry.add_to_shopping_list(r)
    actual = pantry.shopping_list

    assert_equal [{"Cheese"=>20, "Flour"=>20}], actual
  end

  def test_other_shopping_lists
    pantry = Pantry.new
    r = Recipe.new("Spaghetti")
    r.add_ingredient("Noodles", 10)
    r.add_ingredient("Sauce", 10)
    r.add_ingredient("Cheese", 5)
    pantry.add_to_shopping_list(r)
    actual = pantry.shopping_list
    expected = [{"Noodles"=>10, "Sauce"=>10, "Cheese"=>5}]

    assert_equal expected, actual
  end

  def test_print_shopping_list_method
    pantry = Pantry.new
    r = Recipe.new("Spaghetti")
    r.add_ingredient("Noodles", 10)
    r.add_ingredient("Sauce", 10)
    r.add_ingredient("Cheese", 5)
    pantry.add_to_shopping_list(r)

  end
end

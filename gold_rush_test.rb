require 'minitest/autorun'
require_relative 'location'
require_relative 'prospector'
require_relative 'gold_rush'
require 'simplecov'
SimpleCov.start

class GoldRushTest < MiniTest::Test

  # Set up for a new instance of GoldRush
  def setup
  	@gold_rush = GoldRush::new
  end

  # UNIT TESTS FOR GoldRush
  # Verify that creating a GoldRush is an instance of GoldRush and not
  # something else.
  def test_gold_rush_is_gold_rush
    assert @gold_rush.is_a?(GoldRush)
  end

  # Verify that creating a new GoldRush creates a new GoldRush and 
  # verifies that it is not nil
  def test_gold_rush_new_not_nil
    refute_nil @gold_rush
  end

  # UNIT TESTS FOR METHOD initialize
  # Verifies the names for the locations
  def test_fun_city_locs
	@city = GoldRush::new
	assert_equal "El Dorado Canyon", @city.dorado.location
	assert_equal "Midas", @city.midas.location
	assert_equal "Virginia City", @city.virginia.location
	assert_equal "Nevada City", @city.nevada.location
	assert_equal "Coloma", @city.coloma.location
	assert_equal "Angels Camp", @city.angels.location
	assert_equal "Sutter Creek", @city.sutter.location
  end

  # Verifies that the forward paths for these cities are nil
  def test_fun_forward_path
	@city = GoldRush::new
	assert_equal nil, @city.angels.forward_path4
	assert_equal nil, @city.sutter.forward_path3
	assert_equal nil, @city.nevada.forward_path2
  end
	
  # Verifies that the prospectors start off with 0 gold and silver
  def test_amount_gold_silver
	assert_equal 0, @gold_rush.prospector.num_gold
	assert_equal 0, @gold_rush.prospector.num_silver
  end

  # Verifies that there are 5 prospectors
  def test_fun_five_prospectors
	@city = GoldRush::new
	city.initiliaze(1,5)
	assert_equal 5, @city.prospectors.length
  end

  # UNIT TESTS FOR METHOD argchecker
  # Verifies that the program aborts upon finding out there are no arguments
  def test_no_arg
	assert_output(nil, abort) {GoldRush.argchecker()}
  end

  # Verifies that the program aborts upon finding out there's an invalid input
  # EDGE CASE
  def test_no_arg
	assert_output(nil, abort) {GoldRush.argchecker(-1)}
  end

  # UNIT TESTS FOR METHOD set_location
  # Verifies that the initial location of all prospectors is Sutter Creek
  def test_initial_location
	assert_equal "Sutter Creek", @gold_rush.set_location
  end

  # UNIT TESTS FOR METHOD test_calculate
  # Verifies that calculate method returns the right amount of money
  def test_calculate
  	assert_equal '508.16', @gold_rush.calculate(23, 25)
  end

  # Verifies that calculate method returns the right amount of money if there's a negative value
  # EDGE CASE
  def test_calculate_negative
  	assert_equal '0', @gold_rush.calculate(-1, 0)
  end

  # UNIT TESTS FOR NUM_GOLD and NUM_SILVER SETTERS
  # Verifies that the numbers for gold and silver can be set
  def test_current_gold_silver
  	@gold_rush.prospector.num_gold = 2
  	@gold_rush.prospector.num_silver = 3
  	assert_equal 3, @gold_rush.prospector.num_gold
  	assert_equal 2, @gold_rush.prospector.num_silver
  end
  
  # UNIT TESTS FOR METHOD print_location
  # Verifies that location print method works
  def test_print_location
  	@gold_rush.initialize(2, 2)
  	assert_equal "Heading from Sutter Creek to Angels Camp, holding 1 ounce of gold and 0 ounces of silver.", @gold_rush.print_location(@prospectors[0], 0)
  end

  # Verifies that location print method displays Error for a negative way value
  # EDGE CASE
  def test_print_location_negative_way
  	@gold_rush.initialize(2, 2)
  	assert_equal "Error", @gold_rush.print_location(@prospectors[0], -2)
  end
	
  # UNIT TESTS FOR METHOD way_generator
  # Verifies that the way generator returns 1
  def test_way_generator
  	assert_equal 1, @gold_rush.way_generator(1)
  end

  # Verifies that the way generator returns Error for a negative value
  # EDGE CASE
  def test_way_generator
  	assert_equal "Error", @gold_rush.way_generator(-1)
  end

end

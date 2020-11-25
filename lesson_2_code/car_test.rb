require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'car'

class CarTest < MiniTest::Test
  # setup necessary car object
  def setup
    @car = Car.new
  end

  # assert_equal(exp, act)
  # fails unless exp == act
  def test_wheels
    assert_equal(4, @car.wheels)
  end

  # assert(test)
  # fails unless `test` is truthy
  def test_car_exisits
    assert(@car)
  end

  # assert_nil(obj)
  # fails unless `obj` is `nil`
  def test_name_is_nil
    assert_nil(@car.name)
  end

  # assert_raises(*exp) {}
  # fails unless block raises one of `*exp`
  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do 
      Car.new(name: "Joey")
    end
  end

  # assert_instance_of(cls, obj)
  # fails unless `obj` is instance of `cls`
  def test_instance_of_car
    assert_instance_of(Car, @car)
  end

  # assert_includes(collection, obj)
  # fails unless `collection` includes `obj`
  def test_includes_car
    arr = [1, 2, 3]
    arr << @car
    assert_includes(arr, @car)
  end
end


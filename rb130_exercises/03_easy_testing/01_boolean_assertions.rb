=begin
Write a minitest assertion that will fail if the value.odd? is not true.
=end

require 'minitest/autorun'

class BooleanTest < Minitest::Test

  def test_value_odd?
    value = 1
    assert_equal(true, value.odd?, 'value is not odd')
  end 
end
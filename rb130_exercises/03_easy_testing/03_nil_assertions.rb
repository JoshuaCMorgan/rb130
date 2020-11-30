=begin
Write a minitest assertion that will fail if value is not nil.
=end

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TestNil < Minitest::Test
  def setup
    @value = nil 
  end

  def test_value_nil
    assert_nil(@value)
  end
end
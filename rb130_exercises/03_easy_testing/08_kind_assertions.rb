=begin
Write a minitest assertion that will fail if the class of value is not Numeric or one of 
Numeric's subclasses (e.g., Integer, Float, etc).
=end

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class KindTest < MiniTest::Test
  def setup
    @value = 9
  end

  def test_kind
    assert_kind_of(Numeric, @value)
  end
end
=begin
Write a minitest assertion that will fail if value.downcase does not return 'xyz'.
=end

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class EqualityTest < Minitest::Test
  def setup
    @value = "XYZ"
  end 

  def test_value_downcase
    assert_equal('xyz', @value.downcase)
  end 
end
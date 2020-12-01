=begin
Write a test that will fail if 'xyz' is one of the elements in the Array list:
=end

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class RefutationTest < MiniTest::Test
  def setup
    @list = ['abc']
  end

  def test_refute_element
    refute_includes(@list, 'xyz')
  end
end
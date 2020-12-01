=begin
Write a minitest assertion that will fail if the 'xyz' is not in the Array list.
=end

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use! 

class IncludedObject < MiniTest::Test
  def setup
    @list = ['xyz']
  end

  def test_included_object
    assert_includes(@list, 'xyz')
    assert_equals(true, @list.includes?('xyz'))
  end
end
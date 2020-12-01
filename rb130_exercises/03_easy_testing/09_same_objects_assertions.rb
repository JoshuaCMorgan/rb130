=begin
Write a test that will fail if list and the return value of list.process 
are different objects.
=end

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class ListClass
  def process
    self
  end
end

class SameObjectTest < MiniTest::Test
  def setup
    @list = ListClass.new
  end

  def test_same_object
    assert_same(@list, @list.process)
  end
end
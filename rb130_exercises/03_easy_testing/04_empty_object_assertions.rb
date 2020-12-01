=begin
Write a minitest assertion that will fail if the Array list is not empty.
=end

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class EmptyObject < Minitest::Test
  def setup
    @list = []
  end

  def test_list_empty
    assert_equal(true, @list.empty?)
    assert_equal([], @list)
    assert_empty(@list)
  end
end
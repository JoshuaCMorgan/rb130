=begin
Write a minitest assertion that will fail unless employee.hire 
raises a NoExperienceError exception.
=end

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class Employee
  attr_reader :experience

  def initialize(experience)
    @experience = experience
  end 
  
  def hire
    raise("NoExperienceError") if experience == false
  end
end

class ExceptionTest < MiniTest::Test
  def setup
    @employee = Employee.new(false)
  end

  def test_hire
    assert_raises("NoExperienceError") do 
      @employee.hire
    end
  end
end
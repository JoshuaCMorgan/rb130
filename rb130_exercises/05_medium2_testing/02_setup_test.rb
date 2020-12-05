=begin
Let's start things from the ground up. We want to make a simple test suite for 
our CashRegister class. Setup the initial testing file. You don't have to have 
any tests in your test file. For this exercise, write everything you would need 
to start testing CashRegister, excluding the tests themselves (necessary 
requires, test class, etc.).
=end

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'cashregister'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test

end
=begin
Write a test for method CashRegister#give_receipt that ensures 
it displays a valid receipt.
=end

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'cashregister'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(25)
  end

  def test_give_receipt
    assert_output("You've paid $25.\n") do 
      @register.give_receipt(@transaction)
    end 
  end

end
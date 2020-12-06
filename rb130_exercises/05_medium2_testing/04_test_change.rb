=begin
Write a test for the method, CashRegister#change.
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

  def test_change
    @transaction.amount_paid = 35
    expected_change = @transaction.amount_paid - @transaction.item_cost
    actual_change = @register.change(@transaction)
    assert_equal(10, actual_change)
  end
end


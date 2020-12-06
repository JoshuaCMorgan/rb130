=begin
We now have the foundation of our CashRegister test class set up. Let's start 
testing! We'll start with the CashRegister#accept_money method. Write a test for 
the #accept_money method.
=end

=begin
  To work properly 'accept_money' needs
    - total_money
    - transaction with item cost and amount paid

  accept_money will take total_money and increment it by amount paid on trasaction

  assert that total money before money accepted money is same as the total
  of total money minus amount paid, after accepted money is executed.

  get initial amount of total money in register
    - set total money of register to var current_total
  on register object execute accept_money and pass in transaction
    - on object register invoke accept_money method and pass in transaction1
    - total_money will be incremented by amount paid
  get current amount of total money in register
    - set current_amount to total_money of register

  assert that current_amount - amount paid is equal to initial amount

=end

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'cashregister'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def test_accept_money
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    transaction.amount_paid = 20

    previous_amount = register.total_money
    register.accept_money(transaction)
    current_amount = register.total_money

    assert_equal previous_amount + 20, current_amount
  end
end
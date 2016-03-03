require 'test_helper'
require 'minitest/pride'
require 'byebug'

class TransactionTest < ActiveSupport::TestCase
  test "transactions exist" do
    assert Transaction
  end

  test "return balance" do
    assert_equal 590.00, Transaction.total_balance
  end

  test "return total transactions" do
    assert_equal 4, Transaction.total_transactions
  end

  test "return total amount spent" do
    assert_equal 910.00, Transaction.total_spent
  end

  test "return biggest debit" do
    assert_equal 500.00, Transaction.biggest_debit
  end

  # test "return recipient to whom user has spent most money" do
  #   assert_equal "Landlord", Transaction.richest_dealer
  # end
end

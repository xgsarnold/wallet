require 'test_helper'
require 'minitest/pride'

class TransactionTest < ActiveSupport::TestCase
  test "transactions exist" do
    assert Transaction
  end

  test "return balance" do
    assert_equal 590.00, Transaction.total_balance
  end

  test "return total transactions in current month" do
    assert_equal 4, Transaction.total_transactions_now
  end

  test "return total transactions in previous month" do
    assert_equal 0, Transaction.total_transactions_past
  end

  test "return total amount spent in current month" do
    assert_equal 910.00, Transaction.total_debit_now
  end

  test "return total amount spent in previous month" do
    assert_equal 0.00, Transaction.total_debit_past
  end

  test "return biggest debit in current month" do
    assert_equal 500.00, Transaction.biggest_debit_now
  end

  test "return biggeset expense in database" do
    assert_equal 0.00, Transaction.biggest_debit_ever
  end

  test "return recipient to whom user has spent most money" do
    assert_equal "Landlord", Transaction.most_patronized
  end
end

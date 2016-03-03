class DashboardController < ApplicationController
  def index
    @total_balance = Transaction.total_balance
    @total_transactions = Transaction.total_transactions
    @total_spent = Transaction.total_spent
    @biggest_debit = Transaction.biggest_debit
    @richest_dealer = Transaction.richest_dealer
  end

  def show
  end
end

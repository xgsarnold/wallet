class Transaction < ActiveRecord::Base
  def self.debits
    self.all.select {|t| t.activity == "Debit"}
  end

  def self.credits
    self.all.select {|t| t.activity == "Credit"}
  end

  def self.total_spent
    debits.reduce(0) {|sum, debit| sum + debit.amount}
  end

  def self.total_income
    credits.reduce(0) {|sum, credit| sum + credit.amount}
  end

  def self.total_balance
    balance = total_income - total_spent
    if balance < 0.00
      "Hope you enjoy being a debt slave."
    else
      balance
    end
  end

  def self.total_transactions
    self.count
  end

  def self.biggest_debit
    debits.sort.last.amount
  end

  def self.richest_dealer
    debits.sort.last.recipient
  end
end

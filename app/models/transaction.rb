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
    a = []
    debits.each do |d|
      a << d.amount
    end
    a.sort.last
  end

  # def self.richest_dealer
  #   @dealers = {}
  #   debits.each do |d|
  #     @dealers[d.amount] = d.recipient
  #   end
  #   @dealers.values.max
  #   # debits.sort[0].recipient
  # end

  def self.richest_dealer
    where(activity: "Debit").group(:recipient).order("SUM(amount) DESC").first.recipient
  end
end

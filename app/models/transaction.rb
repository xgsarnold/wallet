class Transaction < ActiveRecord::Base
  def self.total_transactions
    self.transactions.count
  end
end

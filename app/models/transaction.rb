class Transaction < ActiveRecord::Base
  def self.total_transactions_now
    self.count
  end
end

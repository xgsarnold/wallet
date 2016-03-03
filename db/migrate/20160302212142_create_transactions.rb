class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :description
      t.string :recipient
      t.string :activity
      t.decimal :amount
      t.decimal :balance

      t.timestamps null: false
    end
  end
end

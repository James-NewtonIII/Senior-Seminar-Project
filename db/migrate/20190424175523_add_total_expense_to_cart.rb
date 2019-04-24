class AddTotalExpenseToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :total_expense, :decimal, default: 0
  end
end

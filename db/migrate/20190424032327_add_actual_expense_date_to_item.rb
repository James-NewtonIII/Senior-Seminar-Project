class AddActualExpenseDateToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :actual_expense_date, :date
  end
end

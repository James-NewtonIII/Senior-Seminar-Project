class AddReferenceToTaf < ActiveRecord::Migration[5.2]
  def change
      add_reference :tafs, :payment_manager
      add_column :tafs, :quantity, :integer, default: 0
  end
end

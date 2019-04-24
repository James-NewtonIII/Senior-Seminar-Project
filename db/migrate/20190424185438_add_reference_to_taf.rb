class AddReferenceToTaf < ActiveRecord::Migration[5.2]
  def change
      add_reference :tafs, :taf_line_item
      add_reference :tafs, :payment_manager

  end
end

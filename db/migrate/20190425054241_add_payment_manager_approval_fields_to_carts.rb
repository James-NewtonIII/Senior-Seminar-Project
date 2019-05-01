class AddPaymentManagerApprovalFieldsToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :pm_approval, :boolean
    add_column :carts, :pm_reason, :string

    add_column :items, :pm_approval, :boolean
    add_column :items, :pm_reason, :string
  end
end

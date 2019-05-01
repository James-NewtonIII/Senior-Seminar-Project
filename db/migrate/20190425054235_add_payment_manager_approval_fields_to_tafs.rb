class AddPaymentManagerApprovalFieldsToTafs < ActiveRecord::Migration[5.2]
  def change
    add_column :tafs, :pm_approval, :boolean
    add_column :tafs, :pm_reason, :string

    add_column :taf_items, :pm_approval, :boolean
    add_column :taf_items, :pm_reason, :string
  end
end

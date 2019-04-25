class AddPaymentManagerApprovalFieldsToTafs < ActiveRecord::Migration[5.2]
  def change
    add_column :tafs, :pm_approval, :boolean
    add_column :tafs, :pm_reason, :string
  end
end

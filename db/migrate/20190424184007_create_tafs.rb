class CreateTafs < ActiveRecord::Migration[5.2]
  def change
    create_table :tafs do |t|
      t.string :pm_reject_reason
      t.decimal :total_estimated_amount, default: 0
      t.timestamps
    end
  end
end

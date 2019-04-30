class CreateTafItems < ActiveRecord::Migration[5.2]
  def change
    create_table :taf_items do |t|
      t.string :request_reason
      t.date :expense_date
      t.decimal :estimated_amount, default: 0
      t.string :dept
      t.boolean :ba_approval
      t.text :ba_reason
      t.string :expense_type

      t.timestamps
    end
  end
end

class CreateRequestItems < ActiveRecord::Migration[5.2]
  def change
    create_table :request_items do |t|
      t.string :expense_type
      t.decimal :amount
      t.text :reason
      t.boolean :ba_approval
      t.string :ba_reason

      t.timestamps
    end
  end
end

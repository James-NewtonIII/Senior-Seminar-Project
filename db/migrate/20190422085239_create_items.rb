class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :expense_type
      t.decimal :amount, precision: 8, scale: 2
      t.boolean :ba_approval
      t.string :ba_reason
      t.string :image_url

      t.timestamps
    end
  end
end

class CreateTafLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :taf_line_items do |t|
      t.references :taf_item
      t.timestamps
    end
  end
end

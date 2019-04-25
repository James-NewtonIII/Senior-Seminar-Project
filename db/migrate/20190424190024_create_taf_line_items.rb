class CreateTafLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :taf_line_items do |t|
      t.references :taf_item, foreign_key: true
      t.belongs_to :taf, foreign_key: true
      t.timestamps
    end
  end
end

class AddReferenceToTafItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :taf_items, :taf_line_items, foreign_key: :true 
  end
end

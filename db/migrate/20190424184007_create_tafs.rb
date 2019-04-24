class CreateTafs < ActiveRecord::Migration[5.2]
  def change
    create_table :tafs do |t|

      t.timestamps
    end
  end
end

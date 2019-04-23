class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :name
      t.decimal :funds

      t.timestamps
    end
  end
end

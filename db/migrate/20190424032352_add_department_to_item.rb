class AddDepartmentToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :department, :string
  end
end

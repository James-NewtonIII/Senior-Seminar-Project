class AddBoatloadsOfReferencesToTables < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :cart_id, :integer, index: true
    add_foreign_key :items, :carts, column: :cart_id

    add_column :employees, :department_id, :integer, index: true
    add_foreign_key :employees, :departments, column: :department_id

    add_column :budget_approvers, :department_id, :integer, index: true
    add_foreign_key :budget_approvers, :departments, column: :department_id
    
    add_column :payment_managers, :department_id, :integer, index: true
    add_foreign_key :payment_managers, :departments, column: :department_id



    add_column :taf_items, :budget_approver_id, :integer, index: true
    add_foreign_key :taf_items, :budget_approvers, column: :budget_approver_id

    add_column :items, :budget_approver_id, :integer, index: true
    add_foreign_key :items, :budget_approvers, column: :budget_approver_id

    add_column :tafs, :all_approved, :boolean, default: false
    add_column :carts, :all_approved, :boolean, default: false

    

    add_column :taf_items, :employee_id, :integer, index: true
    add_foreign_key :taf_items, :employees, column: :employee_id

    add_column :items, :employee_id, :integer, index: true
    add_foreign_key :items, :employees, column: :employee_id



    add_column :tafs, :employee_id, :integer, index: true
    add_foreign_key :tafs, :employees, column: :employee_id

    add_column :carts, :employee_id, :integer, index: true
    add_foreign_key :carts, :employees, column: :employee_id

  end
end

class CompanyController < ApplicationController
  include CurrentTaf
  before_action :set_current_taf, only: [:new, :create]

  def index
    if ( account_signed_in? )
      if (current_account.accountable_type=="Employee")
        @employee = Employee.find(current_account.accountable_id)
       # @tafs = Taf.where(employee_id: @employee.id)
        #@carts = Cart.where(employee_id: @employee.id)
        @tafs = Taf.all
        @carts = Cart.all

        @taf_items = TafItem.all
        @items = Item.all
      elsif (current_account.accountable_type=="BudgetApprover")
        @budget_approver = BudgetApprover.find(current_account.accountable_id)
        @taf_items = TafItem.where(dept: @budget_approver.department_id)
        @items = Item.where(dept: @budget_approver.department_id)
        else
        @tafs = Taf.all
        @carts = Cart.all

        @taf_items = TafItem.all
        @items = Item.all
    end
      
    end
   
    
  end
    
end

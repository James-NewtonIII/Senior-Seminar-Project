class CompanyController < ApplicationController
  include CurrentTaf
  before_action :set_current_taf, only: [:new, :create]

  def index
    if ( account_signed_in? )
      if (current_account.accountable_type=="Employee")
        @employee = Employee.find(current_account.accountable_id)
        @tafs = Taf.where(employee_id: @employee.id)
      elsif (current_account.accountable_type=="BudgetApprover")
        @budget_approver = BudgetApprover.find(current_account.accountable_id)
        @taf_items = TafItem.where(dept: @budget_approver.department_id)
      end
    end
    else
      @tafs = Taf.all
  end
end

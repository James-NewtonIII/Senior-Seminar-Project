class CompanyController < ApplicationController
  include CurrentTaf
  before_action :set_current_taf, only: [:new, :create]

  def index
    if current_account.accountable_type=="Employee"
      @employee = Employee.find(current_account.accountable_id)
      @tafs = Taf.where(employee_id: @employee.id)
    else
      @tafs = Taf.all
    end 
  end
end

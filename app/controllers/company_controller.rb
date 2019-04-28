class CompanyController < ApplicationController
  include CurrentTaf
  before_action :set_current_taf, only: [:new, :create]

  def index
    if (params[:employee_id])
      @employee = Employee.find(params[:employee_id])
      @tafs = @employee.tafs
    else
      @tafs = Taf.all
    end 
  end
end

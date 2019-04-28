class CompanyController < ApplicationController
  def index
    if (params[:employee_id])
      @employee = Employee.find(params[:employee_id])
      @tafs = @employee.tafs
    else
      @tafs = Taf.all
    end 
  end
end

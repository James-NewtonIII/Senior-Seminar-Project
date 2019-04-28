class TafsController < ApplicationController
  include CurrentTaf
  before_action :authenticate_account!
  before_action :set_current_taf, only: [:new, :create]
  before_action :set_taf, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_taf

  # GET /tafs
  # GET /tafs.json
  def index
    if (params[:employee_id])
      @employee = Employee.find(params[:employee_id])
      @tafs = @employee.tafs
    else
      @tafs = Taf.all
    end 
  end

  # GET /tafs/1
  # GET /tafs/1.json
  def show
    @departments = Department.order(:id)
  end

  # GET /tafs/new
  def new
    @taf = Taf.new
    @taf_item = TafItem.new
    @taf.taf_items.build
    

    if current_account && current_account.accountable_type == "Employee"
      @taf.employee_id  = Employee.find_by_name(current_account.accountable.name).id
    end

    respond_to do |format|
      format.html
      format.json { render json: {"redirect" => true, "redirect_url" =>new_order_path} }
    end
  end

  # GET /tafs/1/edit
  def edit
    if current_account && current_account.accountable_type == "Payment Manager"
      @taf.payment_manager_id = PaymentManager.find_by_name(current_account.accountable.name).id
    end
  end

  

  def decision
    @tafs = Taf.where(id: params[:id]) 
    if params[:decision] == "true"
      @tafs.update(pm_approval: true)
      redirect_back(fallback_location: :back)
    else
      @tafs.update(pm_approval: false)
      redirect_back(fallback_location: :back)
    end
  end

  # POST /tafs
  # POST /tafs.json
  def create
    @taf = Taf.new(taf_params)
    if current_account && current_account.accountable_type == "Employee"
      @taf.employee_id  = Employee.find_by_name(current_account.accountable.name).id
    end
    
    respond_to do |format|
      if @taf.save
        format.html { redirect_to @taf, notice: 'Taf was successfully created.' }
        format.json { render :show, status: :created, location: @taf }
      else
        format.html { render :new }
        format.json { render json: @taf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tafs/1
  # PATCH/PUT /tafs/1.json
  def update
    respond_to do |format|
      if @taf.update(taf_params)
        format.html { redirect_to @taf, notice: 'Taf was successfully updated.' }
        format.json { render :show, status: :ok, location: @taf }
      else
        format.html { render :edit }
        format.json { render json: @taf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tafs/1
  # DELETE /tafs/1.json
  def destroy
    @taf.destroy
    respond_to do |format|
      format.html { redirect_to tafs_url, notice: 'Taf was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_taf
      @taf = Taf.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def taf_params
      params
        .require(:taf)
        .permit(  :id, 
                  :total_estimated_amount, 
                  :quantity, 
                  :payment_manager_id, 
                  :pm_approval, 
                  :pm_reason, 
                  taf_item_attributes: [
                        :id, 
                        :request_reason, 
                        :expense_date, 
                        :estimated_amount, 
                        :dept, 
                        :ba_approval, 
                        :ba_reason, 
                        :expense_type
                  ]
                )
    end

    def show_tafs_for_payment_manager?
      payment_manager = PaymentManager.find(params[:id])
      authorize payment_manager, :show_taf_for_payment_manager?
      tafs = payment_manager.taf
      tafs.each do |taf_item|
        logger.info(taf_item)
      end
    end

    def show_tafs_for_budget_approver?
      budget_approver = BudgetApprover.find(params[:id])
      authorize budget_approver, :show_taf_for_budget_approver?
      tafs = budget_approver.taf
      tafs.each do |taf_item|
        logger.info(taf_item)
      end
    end

    def show_tafs_for_employee?
      employee = Employee.find(params[:id])
      authorize employee, :show_taf_for_employee?
      tafs = employee.taf
      tafs.each do |taf_item|
        logger.info(taf_item)
      end
    end

    def invalid_taf
      logger.error "Attempt to access invalid TAF #{params[:id]}"
      redirect_to company_index_url, notice: 'Invalid TAF'
    end
end

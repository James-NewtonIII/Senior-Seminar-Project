class TafItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  include CurrentTaf
  before_action :set_current_taf, only: [:create]
  before_action :set_taf_item, only: [:show, :edit, :update, :destroy]

  def pundit_user
    current_account
  end

  # GET /taf_items
  # GET /taf_items.json
  def index
    if (params[:employee_id])
      @employee = Employee.find(params[:employeeid])
      @taf_items = @employee.taf_items
    elsif (params[:budget_approver_id])
      @department = Department.find(params[:budget_approver_id])
      @taf_items = @department.taf_items
    else
      @taf_items = TafItem.all
    end
  end

  # GET /taf_items/1
  # GET /taf_items/1.json
  def show
    authorize @taf_item
  end

  # GET /taf_items/new
  def new
    @taf_item = TafItem.new
    authorize @taf_item
  end

  # GET /taf_items/1/edit
  def edit
    authorize @taf_item
  end

  def decision
    @taf_item = TafItem.where(id: params[:id]) 
    if params[:decision] == "true"
      @taf_item.update(ba_approval: true)
      @taf_item.update(budget_approver_id: current_account.accountable_id)
      redirect_back(fallback_location: :back)
    else
      @taf_item.update(ba_approval: false)
      @taf_item.update(budget_approver_id: current_account.accountable_id)
      redirect_back(fallback_location: :back)
    end
  end

  
  # POST /taf_items
  # POST /taf_items.json
  def create
    @taf_item = TafItem.new(taf_item_params)

    puts current_account.accountable_id
    puts current_account.id
    if current_account && current_account.accountable_type == "Employee"
      @taf_item.employee = current_account.accountable
      
    
      @taf_item = @taf.add_taf_item(@taf_item)
      respond_to do |format|
        if @taf_item.save
          format.html { redirect_back(fallback_location: :back) }
          @taf_item.update(employee_id: current_account.accountable_id)
          @taf_item.update(request_reason: taf_item_params[:request_reason])
          @taf_item.update(expense_date: taf_item_params[:expense_date])
          @taf_item.update(estimated_amount: taf_item_params[:estimated_amount])
          @taf_item.update(expense_type: taf_item_params[:expense_type])

          if taf_item_params[:dept] == "QA"
            @taf_item.update(dept: 1)
          elsif taf_item_params[:dept] == "RnD"
            @taf_item.update(dept: 2)
          else
            @taf_item.update(dept: 3)
          end

          if taf_item_params[:expense_type] == 'Travel'
            @taf_item.update(expense_type: "Travel")
            puts "\nTravel\n"
          elsif taf_item_params[:expense_type] == 'Taxi'
            @taf_item.update(expense_type: "Taxi")
            puts "\nTaxi\n"
          elsif taf_item_params[:expense_type] == 'Lodging'
            @taf_item.update(expense_type: "Lodging")
            puts "\nLodging\n"
          elsif taf_item_params[:expense_type] == 'Food'
            @taf_item.update(expense_type: "Food")
            puts "\nFood\n"
          else
            @taf_item.update(expense_type: "Other")
            puts "\nOther\n\n"
          end
          

        else
          format.html { render :new }
          format.json { render json: @taf_item.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /taf_items/1
  # PATCH/PUT /taf_items/1.json
  def update
    respond_to do |format|
      if @taf_item.update(taf_item_params)
        format.html { redirect_back(fallback_location: :back) }
        format.json { render :show, status: :ok, location: @taf_item }
      else
        format.html { render :edit }
        format.json { render json: @taf_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taf_items/1
  # DELETE /taf_items/1.json
  def destroy
    authorize @taf_item
    @taf_item.destroy
    respond_to do |format|
      format.html { redirect_to taf_items_url, notice: 'Taf item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_taf_item
      @taf_item = TafItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def taf_item_params
      params.require(:taf_item).permit(:request_reason, :expense_date, :estimated_amount, :dept, :ba_approval, :ba_reason)
    end

    def show_taf_items_for_payment_manager?
      payment_manager = PaymentManager.find(params[:id])
      authorize payment_manager, :show_taf_items_for_payment_manager?
      taf_items = payment_manager.taf_items
      taf_items.each do |taf_item|
        logger.info(taf_item)
      end
    end

    def show_taf_items_for_budget_approver?
      budget_approver = BudgetApprover.find(params[:id])
      authorize budget_approver, :show_taf_items_for_budget_approver?
      taf_items = budget_approver.taf_items
      taf_items.each do |taf_item|
        logger.info(taf_item)
      end
    end

    def show_taf_items_for_employee?
      employee = Employee.find(params[:id])
      authorize employee, :show_taf_items_for_employee?
      taf_items = employee.taf_items
      taf_items.each do |taf_item|
        logger.info(taf_item)
      end
    end 
    
end

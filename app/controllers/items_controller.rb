class ItemsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def pundit_user
    current_account
  end

  # GET /items
  # GET /items.json
  def index
    if (params[:employee_id])
      @employee = Employee.find(params[:employee_id])
      @items = @employee.items
    elsif (params[:budget_approver_id])
      @department = Department.find(params[:budget_approver_id])
      @items = @department.items
    else
      @items = Item.all
    end  
  end

  # GET /items/1
  # GET /items/1.json
  def show
    authorize @item
  end

  # GET /items/new
  def new
    @item = Item.new
    authorize @item
  end

  # GET /items/1/edit
  def edit
    authorize @item
  end
  
  def decision
    @item = Item.where(id: params[:id]) 
    if params[:decision] == "true"
      @item.update(ba_approval: true)
      redirect_back(fallback_location: :back)
    else
      @taf_item.update(ba_approval: false)
      redirect_back(fallback_location: :back)
    end
  end
  

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.image_url='receipt.jpg'
    authorize @item
    if current_account && current_account.accountable_type == "Employee"
        @item.employee = current_account.accountable
    end
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    authorize @item
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    authorize @item
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:expense_type, :department, :actual_expense_date, :amount, :ba_approval, :ba_reason, :image_url)
    end

    def show_items_for_payment_manager?
      payment_manager = PaymentManager.find(params[:id])
      authorize payment_manager, :show_items_for_payment_manager?
      items = payment_manager.items
      items.each do |item|
        logger.info(item)
      end
    end
    
    def show_items_for_budget_approver?
      budget_approver = BudgetApprover.find(params[:id])
      authorize budget_approver, :show_items_for_budget_approver?
      items = budget_approver.items
      items.each do |item|
        logger.info(item)
      end
    end 

    def show_items_for_employee?
      employee = Employee.find(params[:id])
      authorize employee, :show_items_for_employee?
      items = employee.items
      items.each do |item|
        logger.info(item)
      end
    end 

end

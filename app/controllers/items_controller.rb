class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  include CurrentCart
  before_action :set_current_cart, only: [:create, :show, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def pundit_user
    current_account
  end

  # GET /items
  # GET /items.json
  def index
  if ( account_signed_in? )
      if (current_account.accountable_type=="Employee")
        @employee = Employee.find(current_account.accountable_id)
        @carts = Cart.where(employee_id: @employee.id)
        @items = @employee.items
      elsif (current_account.accountable_type=="BudgetApprover")
        @budget_approver = BudgetApprover.find(current_account.accountable_id)
        @items = Item.where(department: @budget_approver.department_id)
        @dpt = Department.find(@budget_approver.department_id)
      end
  else
    @carts = Cart.all
  end
  
  
  
  end

  # GET /items/1
  # GET /items/1.json
  def show
    # authorize @item
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
      @item.update(budget_approver_id: current_account.accountable_id)
      redirect_back(fallback_location: :back)
    else
      @item.update(ba_approval: false)
      @item.update(budget_approver_id: current_account.accountable_id)
      redirect_back(fallback_location: :back)
    end
  end
  

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.image_url='receipt.jpg'
     puts current_account.accountable_id
    puts current_account.id
    if current_account && current_account.accountable_type == "Employee"
      @item.employee = current_account.accountable
      
    
      @item = @cart.add_item(@item)
      respond_to do |format|
        if @item.save
          format.html { redirect_to( company_index_path) }
          @item.update(employee_id: current_account.accountable_id)
          @item.update(actual_expense_date: item_params[:actual_expense_date])
          @item.update(amount: item_params[:amount])
          @item.update(expense_type: item_params[:expense_type])

          if item_params[:department] == "QA"
            @item.update(department: 1)
          elsif item_params[:department] == "RnD"
            @item.update(department: 2)
          else
            @item.update(department: 3)
          end

          if item_params[:expense_type] == 'Travel'
            @item.update(expense_type: "Travel")
            puts "\nTravel\n"
          elsif item_params[:expense_type] == 'Taxi'
            @item.update(expense_type: "Taxi")
            puts "\nTaxi\n"
          elsif item_params[:expense_type] == 'Lodging'
            @item.update(expense_type: "Lodging")
            puts "\nLodging\n"
          elsif item_params[:expense_type] == 'Food'
            @item.update(expense_type: "Food")
            puts "\nFood\n"
          else
            @item.update(expense_type: "Other")
            puts "\nOther\n\n"
          end
          

        else
          format.html { render :new }
          format.json { render json: @taf_item.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        

        if current_account.accountable_type == "Employee"
          @item.update(ba_reason: nil)
          @item.update(ba_approval: false)
          @item.update(pm_approval: false)
          @item.update(pm_reason: nil)
        end

        if item_params[:department] == "QA"
          @item.update(department: 1)
        elsif item_params[:department] == "RnD"
          @item.update(department: 2)
        else
          @item.update(department: 3)
        end
        
        if current_account.accountable_type == "BudgetApprover"
          @item.update(budget_approver_id: current_account.accountable_id)

          if @item.ba_approval == true 
            @total = @cart.total_expense+=@item.amount
            @dpt = Department.find(@item.department)
            @dpt.update(available_funds: (@dpt.available_funds - @item.amount))
            
          else
            @dpt = Department.find(@item.department)
            @dpt.update(available_funds: (@dpt.available_funds + @item.amount))
           
          end

        end
        
        if current_account.accountable_type == "PaymentManager"
          @item.update(payment_manager_id: current_account.accountable_id)
          
          if @item.pm_approval == true && @bool == false
            @total = @cart.total_expense+=@item.amount
            @dpt = Department.find(@item.department)
            @dpt.update(actual_funds: (@dpt.actual_funds - @item.amount))
            @bool = true
          else
            @dpt = Department.find(@item.department)
            @dpt.update(actual_funds: (@dpt.actual_funds + @item.amount))
            if @item.pm_approval == true
              @bool = false
            end
          end
        end
        @item.update(pm_reason: item_params[:pm_reason])
        
       
        format.html { redirect_back(fallback_location: :back) }
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
      params.require(:item).permit(:expense_type, :department, :actual_expense_date, :amount, :ba_approval, :ba_reason, :image_url, :pm_approval, :pm_reason, :employee_id)
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

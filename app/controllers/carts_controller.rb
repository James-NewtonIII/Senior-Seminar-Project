class CartsController < ApplicationController
  include CurrentCart
  before_action :authenticate_account!
   before_action :set_current_cart, only: [:new]
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  # GET /carts
  # GET /carts.json
  def index
    if (params[:employee_id])
      @employee = Employee.find(params[:employee_id])
      @carts = @employee.carts
    else
      @carts = Cart.all
    end
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    @departments = Department.order(:id)
  end

  # GET /carts/new
  def new
    @cart = Cart.new
    @cart.items.build
    if current_account && current_account.accountable_type == "Employee"
      @cart.employee_id  = Employee.find_by_name(current_account.accountable.name).id
    end
    respond_to do |format|
      format.html
      format.json { render json: {"redirect" => true, "redirect_url" =>new_order_path} }
    end
  end

  # GET /carts/1/edit
  def edit
    if current_account && current_account.accountable_type == "Payment Manager"
      @cart.payment_manager_id = PaymentManager.find_by_name(current_account.accountable.name).id
    end
  end

  def decision
    @cart = Cart.where(id: params[:id]) 
    if params[:decision] == "true"
      @cart.update(pm_approval: true)
    else
      @cart.update(pm_approval: false)
    end
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)
    if current_account && current_account.accountable_type == "Employee"
      @item.employee = current_account.accountable
    end
    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Expense Report was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Expense Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Expense Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.fetch(:cart, {})
    end

    def show_carts_for_payment_manager?
      payment_manager = PaymentManager.find(params[:id])
      authorize payment_manager, :show_cart_for_payment_manager?
      carts = payment_manager.cart
      carts.each do |cart_item|
        logger.info(cart_item)
      end
    end

    def show_carts_for_budget_approver?
      budget_approver = BudgetApprover.find(params[:id])
      authorize budget_approver, :show_cart_for_budget_approver?
      carts = budget_approver.cart
      carts.each do |cart_item|
        logger.info(cart_item)
      end
    end

    def show_carts_for_employee?
      employee = Employee.find(params[:id])
      authorize employee, :show_cart_for_employee?
      carts = employee.cart
      carts.each do |cart_item|
        logger.info(cart_item)
      end
    end

    def invalid_cart
      logger.error "Attempt to access invalid Expense Report #{params[:id]}"
      redirect_to company_index_url, notice: 'Invalid Expense Report'
    end

end

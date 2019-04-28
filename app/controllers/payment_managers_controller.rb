class PaymentManagersController < ApplicationController
  before_action :authenticate_account!
  before_action :set_payment_manager, only: [:edit, :update]

  def pundit_user
    current_account
  end

  # GET /payment_managers
  # GET /payment_managers.json
  def index
    @payment_managers = PaymentManager.all
  end

  # GET /payment_managers/1
  # GET /payment_managers/1.json
  def show
  end

  # GET /payment_managers/new
  def new
    @payment_manager = PaymentManager.new
  end

  # GET /payment_managers/1/edit
  def edit
    authorize @payment_manager
  end

  # POST /payment_managers
  # POST /payment_managers.json
  def create
    @payment_manager = PaymentManager.new(payment_manager_params)

    respond_to do |format|
      if @payment_manager.save
        format.html { redirect_to @payment_manager, notice: 'Payment manager was successfully created.' }
        format.json { render :show, status: :created, location: @payment_manager }
      else
        format.html { render :new }
        format.json { render json: @payment_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_managers/1
  # PATCH/PUT /payment_managers/1.json
  def update
    authorize @payment_manager
    respond_to do |format|
      if @payment_manager.update(payment_manager_params)
        format.html { redirect_to @payment_manager, notice: 'Payment manager was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment_manager }
      else
        format.html { render :edit }
        format.json { render json: @payment_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_managers/1
  # DELETE /payment_managers/1.json
  def destroy
    @payment_manager.destroy
    respond_to do |format|
      format.html { redirect_to payment_managers_url, notice: 'Payment manager was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_manager
      @payment_manager = PaymentManager.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_manager_params
      params.fetch(:payment_manager, {})
    end
end

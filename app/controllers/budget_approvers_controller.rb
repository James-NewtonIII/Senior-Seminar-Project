class BudgetApproversController < ApplicationController
  before_action :set_budget_approver, only: [:show, :edit, :update, :destroy]

  # GET /budget_approvers
  # GET /budget_approvers.json
  def index
    @budget_approvers = BudgetApprover.all
  end

  # GET /budget_approvers/1
  # GET /budget_approvers/1.json
  def show
  end

  # GET /budget_approvers/new
  def new
    @budget_approver = BudgetApprover.new
  end

  # GET /budget_approvers/1/edit
  def edit
  end

  # POST /budget_approvers
  # POST /budget_approvers.json
  def create
    @budget_approver = BudgetApprover.new(budget_approver_params)

    respond_to do |format|
      if @budget_approver.save
        format.html { redirect_to @budget_approver, notice: 'Budget approver was successfully created.' }
        format.json { render :show, status: :created, location: @budget_approver }
      else
        format.html { render :new }
        format.json { render json: @budget_approver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /budget_approvers/1
  # PATCH/PUT /budget_approvers/1.json
  def update
    respond_to do |format|
      if @budget_approver.update(budget_approver_params)
        format.html { redirect_to @budget_approver, notice: 'Budget approver was successfully updated.' }
        format.json { render :show, status: :ok, location: @budget_approver }
      else
        format.html { render :edit }
        format.json { render json: @budget_approver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budget_approvers/1
  # DELETE /budget_approvers/1.json
  def destroy
    @budget_approver.destroy
    respond_to do |format|
      format.html { redirect_to budget_approvers_url, notice: 'Budget approver was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_budget_approver
      @budget_approver = BudgetApprover.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def budget_approver_params
      params.fetch(:budget_approver, {})
    end
end

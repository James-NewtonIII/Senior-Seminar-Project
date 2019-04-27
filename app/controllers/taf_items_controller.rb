class TafItemsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_taf_item, only: [:show, :edit, :update, :destroy]

  def pundit_user
    current_account
  end

  # GET /taf_items
  # GET /taf_items.json
  def index
    @taf_items = TafItem.all
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
    else
      @taf_item.update(ba_approval: false)
    end
  end

  # POST /taf_items
  # POST /taf_items.json
  def create
    @taf_item = TafItem.new(taf_item_params)
    authorize @taf_item
    
    respond_to do |format|
      if @taf_item.save
        format.html { redirect_to @taf_item, notice: 'Taf item was successfully created.' }
        format.js { @current_item = @taf_line_item }
        format.json { render :show, status: :created, location: @taf_item }
       
        
      else
        format.html { render :new }
        format.json { render json: @taf_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /taf_items/1
  # PATCH/PUT /taf_items/1.json
  def update
    respond_to do |format|
      if @taf_item.update(taf_item_params)
        format.html { redirect_to @taf_item, notice: 'Taf item was successfully updated.' }
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

    def show_taf_items_for_employee
      employee = Employee.find(params[:id])

      authorize employee, :show_taf_for_employee?
      taf_items = employee.taf_items
      @taf_items = TafItem.where(taf_item_id: taf_items)
      taf_items.each do |taf_item|
        logger.info(taf_item)
      end
    end 
    
end

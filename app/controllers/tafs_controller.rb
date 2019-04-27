class TafsController < ApplicationController
  include CurrentTaf
  before_action :set_current_taf, only: [:new, :show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_taf

  # GET /tafs
  # GET /tafs.json
  def index
    @tafs = Taf.all
  end

  # GET /tafs/1
  # GET /tafs/1.json
  def show
    @departments = Department.order(:id)
  end

  # GET /tafs/new
  def new
    @taf = Taf.new
    @new_taf_item_form = TafLineItem.new
    @taf_item = TafItem.new
    @taf_line_item = TafLineItem.new(params[taf_id: @taf.id, taf_item_id: @taf_item.id])
    #@taf_item.new_taf_item_form.build
  end

  # GET /tafs/1/edit
  def edit
  end

  def decision
    @tafs = Taf.where(id: params[:id]) 
    if params[:decision] == "true"
      @tafs.update(pm_approval: true)
    else
      @tafs.update(pm_approval: false)
    end
  end

  

  # POST /tafs
  # POST /tafs.json
  def create
    @taf = Taf.new(taf_params)

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
        .permit(:id, :total_estimated_amount, :quantity, :payment_manager_id, :pm_approval, :pm_reason, taf_item_attributes: TafItem.attribute_names.map(&:to_sym).push(:_destroy))
    end

    def invalid_taf
      logger.error "Attempt to access invalid TAF #{params[:id]}"
      redirect_to company_index_url, notice: 'Invalid TAF'
    end
end

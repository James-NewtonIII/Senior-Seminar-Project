class TafItemsController < ApplicationController
  before_action :set_taf_item, only: [:show, :edit, :update, :destroy]

  # GET /taf_items
  # GET /taf_items.json
  def index
    @taf_items = TafItem.all
  end

  # GET /taf_items/1
  # GET /taf_items/1.json
  def show
  end

  # GET /taf_items/new
  def new
    @taf_item = TafItem.new
  end

  # GET /taf_items/1/edit
  def edit
  end

  # POST /taf_items
  # POST /taf_items.json
  def create
    @taf_item = TafItem.new(taf_item_params)

    respond_to do |format|
      if @taf_item.save
        format.html { redirect_to @taf_item, notice: 'Taf item was successfully created.' }
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
end

class TafLineItemsController < ApplicationController
  include CurrentTaf
  before_action :set_taf, only: [:create]
  before_action :set_taf_line_item, only: [:show, :edit, :update, :destroy]

  # GET /taf_line_items
  # GET /taf_line_items.json
  def index
    @taf_line_items = TafLineItem.all
  end

  # GET /taf_line_items/1
  # GET /taf_line_items/1.json
  def show
  end

  # GET /taf_line_items/new
  def new
    @taf_line_item = TafLineItem.new
  end

  # GET /taf_line_items/1/edit
  def edit
  end

  def decision
    @taf_item = TafItem.where(id: params[:id]) 
    if params[:decision] == "true"
      @taf_item.update(ba_approval: true)
    else
      @taf_item.update(ba_approval: false)
    end
  end

  # POST /taf_line_items
  # POST /taf_line_items.json
  def create
    taf_item = TafItem.find(params[:taf_item_id])
    @taf_line_item = TafLineItem.new(taf_line_item_params)

    respond_to do |format|
      if @taf_line_item.save
        format.html { redirect_to @taf_line_item, notice: 'Taf line item was successfully created.' }
        format.json { render :show, status: :created, location: @taf_line_item }
      else
        format.html { render :new }
        format.json { render json: @taf_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /taf_line_items/1
  # PATCH/PUT /taf_line_items/1.json
  def update
    respond_to do |format|
      if @taf_line_item.update(taf_line_item_params)
        format.html { redirect_to @taf_line_item, notice: 'Taf line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @taf_line_item }
      else
        format.html { render :edit }
        format.json { render json: @taf_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taf_line_items/1
  # DELETE /taf_line_items/1.json
  def destroy
    @taf_line_item.destroy
    respond_to do |format|
      format.html { redirect_to taf_line_items_url, notice: 'Taf line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_taf_line_item
      @taf_line_item = TafLineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def taf_line_item_params
      params.require(:taf_line_item).permit(:taf_item_id, :taf_id)
    end
end

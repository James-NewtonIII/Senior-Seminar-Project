class TafsController < ApplicationController
  before_action :set_taf, only: [:show, :edit, :update, :destroy]

  # GET /tafs
  # GET /tafs.json
  def index
    @tafs = Taf.all
  end

  # GET /tafs/1
  # GET /tafs/1.json
  def show
  end

  # GET /tafs/new
  def new
    @taf = Taf.new
  end

  # GET /tafs/1/edit
  def edit
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
      params.fetch(:taf, {})
    end
end

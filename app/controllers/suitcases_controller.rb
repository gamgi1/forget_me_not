class SuitcasesController < ApplicationController
  before_action :set_suitcase, only: [:show, :edit, :update, :destroy]

  # GET /suitcases
  # GET /suitcases.json
  def index
    @suitcases = Suitcase.all
  end

  # GET /suitcases/1
  # GET /suitcases/1.json
  def show
    @items = Item.all
    @female_items = []
    @required_items = []
    @days_specific_items = []
    @optional_items = []
  end

  # GET /suitcases/new
  def new
    @suitcase = Suitcase.new
  end

  # GET /suitcases/1/edit
  def edit
  end

  # POST /suitcases
  # POST /suitcases.json
  def create
    @suitcase = Suitcase.new(suitcase_params)

    respond_to do |format|
      if @suitcase.save
        format.html { redirect_to @suitcase, notice: 'Suitcase was successfully created.' }
        format.json { render :show, status: :created, location: @suitcase }
      else
        format.html { render :new }
        format.json { render json: @suitcase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suitcases/1
  # PATCH/PUT /suitcases/1.json
  def update
    respond_to do |format|
      if @suitcase.update(suitcase_params)
        format.html { redirect_to @suitcase, notice: 'Suitcase was successfully updated.' }
        format.json { render :show, status: :ok, location: @suitcase }
      else
        format.html { render :edit }
        format.json { render json: @suitcase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suitcases/1
  # DELETE /suitcases/1.json
  def destroy
    @suitcase.destroy
    respond_to do |format|
      format.html { redirect_to suitcases_url, notice: 'Suitcase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suitcase
      @suitcase = Suitcase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def suitcase_params
      params.require(:suitcase).permit(:name, :days, :gender)
    end
end

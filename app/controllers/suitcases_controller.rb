class SuitcasesController < ApplicationController
  before_action :authenticate_user
  before_action :set_user
  before_action :set_suitcase, only: [:update, :destroy]

  # GET /suitcases
  # GET /suitcases.json
  def index
    @suitcases = @user.suitcases
  end

  # GET /suitcases/1
  # GET /suitcases/1.json
  def show
    @suitcase = @user.suitcases.find(params[:id])
    @items = Item.all
    @female_items = []
    @required_items = []
    @days_specific_items = []
    @optional_items = []
  end

  # GET /suitcases/new
  def new
    #@user = current_user.id
    @suitcase = @user.suitcases.build
  end

  # GET /suitcases/1/edit
  def edit
    @suitcase = @user.suitcases.find(params[:id])
  end

  # POST /suitcases
  # POST /suitcases.json
  def create
    @suitcase = @user.suitcases.build(suitcase_params)
    if @suitcase.save
      redirect_to user_suitcases_path(@user.id)
    else
      render :new
    end
  end

  # PATCH/PUT /suitcases/1
  # PATCH/PUT /suitcases/1.json
  def update
    if @suitcase.update_attributes(suitcase_params)
      redirect_to user_suitcases_path(@user.id)
    else
      render :edit
    end
  end

  # DELETE /suitcases/1
  # DELETE /suitcases/1.json
  def destroy
    @suitcase.destroy
    respond_to do |format|
      redirect_to user_suitcases_path(@user.id)
    end
  end

  private
    def set_user
      @user = current_user
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_suitcase
      @suitcase = Suitcase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def suitcase_params
      params.require(:suitcase).permit(:name, :days, :gender)
    end
end

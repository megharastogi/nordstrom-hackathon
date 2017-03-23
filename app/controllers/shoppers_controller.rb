class ShoppersController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  before_action :set_shopper, only: [:show, :edit, :update, :destroy]

  # GET /shoppers
  # GET /shoppers.json
  def index
    @shoppers = Shopper.all #Shopper.where(updated_at: 1.hours.ago..Time.now)
    return @shoppers
  end

  # GET /shoppers/1
  # GET /shoppers/1.json
  def show
  end

  # GET /shoppers/new
  def new
    @shopper = Shopper.new
  end

  # GET /shoppers/1/edit
  def edit
  end

  # POST /shoppers
  # POST /shoppers.json
  def create
    @shoppers = Shopper.where(nord_shopper_id: shopper_params['nord_shopper_id']).limit(1)
    @styleparams = shopper_params.delete('styles')
    @shopper_params = {"name" => shopper_params['name'], "nord_shopper_id" => shopper_params['nord_shopper_id'],"loyalty"=> shopper_params['loyalty'],"department"=>shopper_params['department']}
    if @shoppers.count > 0
      @shopper = @shoppers.first
      @shopper.update_attributes(@shopper_params)
    else
      @shopper = Shopper.new(@shopper_params)
    end

    respond_to do |format|
      if @shopper.save
          @shopper.styles.each do |s|
            s.delete
          end 
          @objArray = JSON.parse(@styleparams)
          @objArray.each do |s|
            @style = Style.new(s)
            @style.shopper_id = @shopper.id
            @style.save
          end
        format.html { redirect_to @shopper, notice: 'Shopper was successfully created.' }
        format.json { render :show, status: :created, location: @shopper }
      else
        format.html { render :new }
        format.json { render json: @shopper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shoppers/1
  # PATCH/PUT /shoppers/1.json
  def update
    respond_to do |format|
      if @shopper.update(shopper_params)
        format.html { redirect_to @shopper, notice: 'Shopper was successfully updated.' }
        format.json { render :show, status: :ok, location: @shopper }
      else
        format.html { render :edit }
        format.json { render json: @shopper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shoppers/1
  # DELETE /shoppers/1.json
  def destroy
    @shopper.destroy
    respond_to do |format|
      format.html { redirect_to shoppers_url, notice: 'Shopper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopper
      @shopper = Shopper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shopper_params
      params.require(:shopper).permit(:name, :loyalty, :department,:nord_shopper_id, :styles)
    end
end

class AffiliatesController < ApplicationController
  before_action :set_affiliate, only: [:show, :edit, :update, :destroy]
  before_action :require_login

   def require_login
    redirect_to :controller => 'welcome', :action => 'show' unless user_signed_in?
  end

  # GET /affiliates
  # GET /affiliates.json
  def index
    @affiliates = Affiliate.all
  end

  # GET /affiliates/1
  # GET /affiliates/1.json
  def show
  end

  # GET /affiliates/new
  def new
    @affiliate = Affiliate.new
  end

  # GET /affiliates/1/edit
  def edit
  end

  # POST /affiliates
  # POST /affiliates.json
  def create
    @affiliate = Affiliate.new(affiliate_params)

    respond_to do |format|
      if @affiliate.save
        format.html { redirect_to @affiliate, notice: 'Affiliate was successfully created.' }
        format.json { render :show, status: :created, location: @affiliate }
      else
        format.html { render :new }
        format.json { render json: @affiliate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /affiliates/1
  # PATCH/PUT /affiliates/1.json
  def update
    respond_to do |format|
      if @affiliate.update(affiliate_params)
        format.html { redirect_to @affiliate, notice: 'Affiliate was successfully updated.' }
        format.json { render :show, status: :ok, location: @affiliate }
      else
        format.html { render :edit }
        format.json { render json: @affiliate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /affiliates/1
  # DELETE /affiliates/1.json
  def destroy
    @affiliate.destroy
    respond_to do |format|
      format.html { redirect_to affiliates_url, notice: 'Affiliate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_affiliate
      @affiliate = Affiliate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def affiliate_params
      params.require(:affiliate).permit(:name, :user_id, :type, :plan, :weight)
    end
end

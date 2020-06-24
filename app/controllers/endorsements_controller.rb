class EndorsementsController < ApplicationController
  before_action :set_endorsement, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  def require_login
    redirect_to :controller => 'welcome', :action => 'show' unless user_signed_in?
  end

  # GET /endorsements
  # GET /endorsements.json
  def index
    @endorsements = Endorsement.all
  end

  # GET /endorsements/1
  # GET /endorsements/1.json
  def show
  end

  # GET /endorsements/new
  def new
    @endorsement = Endorsement.new
  end

  # GET /endorsements/1/edit
  def edit
  end

  # POST /endorsements
  # POST /endorsements.json
  def create
    @endorsement = Endorsement.new(endorsement_params)

    respond_to do |format|
      if @endorsement.save
        format.html { redirect_to @endorsement, notice: 'Endorsement was successfully created.' }
        format.json { render :show, status: :created, location: @endorsement }
      else
        format.html { render :new }
        format.json { render json: @endorsement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /endorsements/1
  # PATCH/PUT /endorsements/1.json
  def update
    respond_to do |format|
      if @endorsement.update(endorsement_params)
        format.html { redirect_to @endorsement, notice: 'Endorsement was successfully updated.' }
        format.json { render :show, status: :ok, location: @endorsement }
      else
        format.html { render :edit }
        format.json { render json: @endorsement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /endorsements/1
  # DELETE /endorsements/1.json
  def destroy
    @endorsement.destroy
    respond_to do |format|
      format.html { redirect_to endorsements_url, notice: 'Endorsement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_endorsement
      @endorsement = Endorsement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def endorsement_params
      params.require(:endorsement).permit(:affiliate_id, :name, :caption, :enabled, :media_uri, :media_type)
    end
end

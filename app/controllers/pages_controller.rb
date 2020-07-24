class PagesController < ApplicationController
#  load_and_authorize_resource
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
#    redirect_to :controller => 'welcome', :action => 'show' unless (user_signed_in? || params["demo"]=="show")
    @page=Page.find_by(slug: "not-found") if @page.nil?
    if @page.layout.present?
      render :layout => @page.layout
    end
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_page
    @page = Page.find(params[:id]) if params[:id].present?
    @page = Page.find_by(slug: params["slug"]) if params["slug"].present?
    if params["slug"].present? && @page.nil?
      if File.exist?(File.join(Rails.root, "app/views/pages","_page_#{params["slug"]}.html.erb"))
        @page = Page.create(title: params['slug'].titleize,
                            description: "This is a sample page",
                            main_html: '<ul><li><a href="#">Sample Link</a>?,li><li><a href="#">Sample Link</a>?,li><li><a href="#">Sample Link</a>?,li><li><a href="#">Sample Link</a>?,li></ul>',
                            slug: params["slug"])
      end
    end
    @page=Page.find_by(slug: "not-found") if @page.nil?        
  end

  # Only allow a list of trusted parameters through.
  def page_params
    params.require(:page).permit(:title, :description, :main_html, :slug)
  end
end

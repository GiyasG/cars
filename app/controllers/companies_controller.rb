class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :show_current_company, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  after_action :verify_authorized, only: [:new, :edit, :update, :destroy]
  before_filter :edit_company_params, :only => [:update]


  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
    authorize @companies
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    respond_to do |format|
	     format.js {render layout: false}
	  end
  end

  def show_current_company
    respond_to do |format|
        format.html { render :show_current_company }
	  end
  end

  # GET /companies/new
  def new
    @company = Company.new
    @logo = @company.logos.new
    authorize @company
  end

  # GET /companies/1/edit
  def edit
    authorize @company
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        @company.user_id = current_user.id
        @company.save
        format.html { redirect_to companies_path, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: companies_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    authorize @company
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    authorize @company
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit_company_params
    authorize @company
    if company_params[:logos_attributes][:"0"][:file].present?
      @logo = @company.logos.find(company_params[:logos_attributes][:"0"][:id])
      @logo.filename = company_params[:logos_attributes][:"0"][:file].original_filename
      @logo.content_type = company_params[:logos_attributes][:"0"][:file].content_type
      @logo.file_contents = company_params[:logos_attributes][:"0"][:file].read
      @logo.save
      params[:company][:logos_attributes][:"0"].except!(:file)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :description, :contactname, :street, :city, :postcode, :country, :phone, :email, :homepage,
                     logos_attributes: [:file, :description, :id])
    end

end

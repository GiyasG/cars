class CarpartsController < ApplicationController
  before_action :set_car, only: [:add_detail,:new, :create, :index, :show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  after_action :verify_authorized, only: [:new, :edit, :update, :destroy]
  before_filter :edit_carpart_params, :only => [:update]
  before_filter :check_details, :only => [:create, :update]



  def index
    @company = Company.find(params[:company_id])
    @carparts = @car.carparts.all
    authorize @company
  end

  def show
    @company = Company.find(params[:company_id])
    @carpart = @car.carparts.find(params[:id])
    authorize @company
  end
 #
 def new
   @company = Company.find(params[:company_id])
   @carpart = @car.carparts.new
   authorize @company
   @photo = @carpart.photos.new
 end

 def edit
   @company = Company.find(params[:company_id])
   @carpart = @car.carparts.find(params[:id])
   authorize @company
 end

 def create
   # binding.pry
   @company = Company.find(params[:company_id])
   @carpart = @car.carparts.new(carpart_params)
   if @carpart.save
     @carpart.company_id = @company.id
     @carpart.save
     redirect_to companies_path, notice: "Part successfully added!"
   else
     @carpart.errors.full_messages.each do |message|
       @notice_p = message
     end
     redirect_to companies_path, alert: "Unable to add part - "+ @notice_p
   end
 end


 def update
   @company = Company.find(params[:company_id])
   @carpart = @car.carparts.find(params[:id])
   authorize @company
     if @carpart.update_attributes(carpart_params) # @carparts.update
       redirect_to companies_path, notice: "Part successfully updated!"
     else
       redirect_to companies_path, alert: "Unable to update part!"
     end

 end


 def destroy
   @company = Company.find(params[:company_id])
   @carpart = @car.carparts.find(params[:id])
   authorize @company
   @carpart.destroy
   redirect_to companies_path, notice: "Part deleted!"
 end


  def edit_carpart_params
    @company = Company.find(params[:company_id])
    @carpart = @car.carparts.find(params[:id])
    # @company = Company.find(params[:company_id])
    # authorize @company
    if carpart_params[:photos_attributes][:"0"][:file].present?
      # binding.pry
      @photo = @carpart.photos.find(carpart_params[:photos_attributes][:"0"][:id])
      @photo.filename = carpart_params[:photos_attributes][:"0"][:file].original_filename
      @photo.content_type = carpart_params[:photos_attributes][:"0"][:file].content_type
      @photo.file_contents = carpart_params[:photos_attributes][:"0"][:file].read
      @photo.save
      params[:carpart][:photos_attributes][:"0"].except!(:file)
    end
  end

  def add_detail
    @company = Company.find(params[:company_id])
    respond_to do |format|
	     format.js {render layout: false}
	  end
  end

  def check_details
    binding.pry
    carpart_params[:detail] = params[:carpart][:detail]
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:car_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def carpart_params
      params.require(:carpart).permit(:name, :code, :description, :detail, :price,
                                      :stock, :reserved, :reservedtime, :paidtime, :sold,
                                       photos_attributes: [:file, :description, :id])
    end
end

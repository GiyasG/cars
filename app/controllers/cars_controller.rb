class CarsController < ApplicationController
  before_action :set_company, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  after_action :verify_authorized, only: [:new, :edit, :update, :destroy]
  before_filter :edit_car_params, :only => [:update]


  def show
    @car = @company.cars.find(params[:id])
    authorize @company
  end
 #
 def new
   @car = @company.cars.new
   authorize @company
   @photo = @car.photos.new
 end

 def edit
   @car = @company.cars.find(params[:id])
   authorize @company
 end

 def create
   # binding.pry
   @car = @company.cars.new(car_params)
   if @car.save
     redirect_to companies_path, notice: "Car successfully added!"
   else
     @car.errors.full_messages.each do |message|
       @notice_p = message
     end
     redirect_to companies_path, alert: "Unable to add car - "+ @notice_p
   end
 end


 def update
   authorize @company
     @car = @company.cars.find(params[:id])
     if @car.update_attributes(car_params) # @car.update
       redirect_to companies_path, notice: "Car successfully updated!"
     else
       redirect_to companies_path, alert: "Unable to update car!"
     end

 end


 def destroy
   authorize @company
   @car = @company.cars.find(params[:id])
   @car.destroy
   redirect_to companies_path, notice: "Car deleted!"
 end


  def edit_car_params
    authorize @company
    if car_params[:photos_attributes][:"0"][:file].present?
      @photo = @car.photos.find(car_params[:photos_attributes][:"0"][:id])
      @photo.filename = car_params[:photos_attributes][:"0"][:file].original_filename
      @photo.content_type = car_params[:photos_attributes][:"0"][:file].content_type
      @photo.file_contents = car_params[:photos_attributes][:"0"][:file].read
      @photo.save
      params[:car][:photos_attributes][:"0"].except!(:file)
    end
  end

  def search_make
    # binding.pry
    @makes = Car.where('makeyear = ?', params[:selected_year])
    respond_to do |format|
	     format.js {render layout: false}
	  end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:company_id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:make, :model, :makeyear, :body, :version, :classification, :bodytype, :door, :seat, :engineplace, :drivetrain,
      photos_attributes: [:file, :description, :id])

    end
end

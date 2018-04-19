class CarpartsController < ApplicationController
  before_action :set_company, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  after_action :verify_authorized, only: [:new, :edit, :update, :destroy]
  before_filter :edit_carpart_params, :only => [:update]


  def show
    @carpart = @company.carparts.find(params[:id])
    authorize @company
  end
 #
 def new
   @carpart = @company.carparts.new
   authorize @company
   @photo = @carparts.photos.new
 end

 def edit
   @carpart = @company.carparts.find(params[:id])
   authorize @company
 end

 def create
   # binding.pry
   @carpart = @company.carparts.new(carpart_params)
   if @carpart.save
     redirect_to companies_path, notice: "Car successfully added!"
   else
     @carpart.errors.full_messages.each do |message|
       @notice_p = message
     end
     redirect_to companies_path, alert: "Unable to add carparts - "+ @notice_p
   end
 end


 def update
   authorize @company
     @carpart = @company.carparts.find(params[:id])
     if @carpart.update_attributes(carpart_params) # @carparts.update
       redirect_to companies_path, notice: "Car successfully updated!"
     else
       redirect_to companies_path, alert: "Unable to update carparts!"
     end

 end


 def destroy
   authorize @company
   @carpart = @company.carparts.find(params[:id])
   @carpart.destroy
   redirect_to companies_path, notice: "Car deleted!"
 end


  def edit_carparts_params
    authorize @company
    if carpart_params[:photos_attributes][:"0"][:file].present?
      @photo = @carpart.photos.find(carpart_params[:photos_attributes][:"0"][:id])
      @photo.filename = carpart_params[:photos_attributes][:"0"][:file].original_filename
      @photo.content_type = carpart_params[:photos_attributes][:"0"][:file].content_type
      @photo.file_contents = carpart_params[:photos_attributes][:"0"][:file].read
      @photo.save
      params[:carpart][:photos_attributes][:"0"].except!(:file)
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:company_id]).cars
      # @car = Car.find(params[:car_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def carpart_params
      params.require(:carpart).permit(:name, :code, :description, :detail, :price,
                                      :stock, :reserved, :reservedtime, :paidtime, :sold,
                                       photos_attributes: [:file, :description, :id])
    end
end

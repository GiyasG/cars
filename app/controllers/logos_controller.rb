class LogosController < ApplicationController
  require "mini_magick"
  before_action :set_company, only: [:edit, :update, :destroy]

    # GET /logos
    # GET /logos.json
    def index
      @logos = Logo.all
    end

    # GET /logos/1
    # GET /logos/1.json
    def show
      @logo = Logo.find(params[:id])
      send_data(@logo.file_contents,
                type: @logo.content_type,
                filename: @logo.filename)
    end


    def show_company
      @logo = Logo.find_by(:company_id=>params[:company_id])
      send_data(@logo.file_contents,
                type: @logo.content_type,
                filename: @logo.filename)
    end

    def show_user
      @logo = Logo.find_by(:user_id=>params[:user_id])
      send_data(@logo.file_contents,
                type: @logo.content_type,
                filename: @logo.filename)
    end

    # def show_team
    #   @team=Team.find(params[:team_id])
    #   @logos = @team.logos
    #   @logos.each do |logo|
    #   # binding.pry
    #   send_data(logo.file_contents,
    #             type: logo.content_type,
    #             filename: logo.filename)
    #           end
    # end

    # def show_paper
    #   @logo = Logo.find_by(:paper_id=>params[:paper_id])
    #   send_data(@logo.file_contents,
    #             type: @logo.content_type,
    #             filename: @logo.filename)
    # end

    # GET /logos/new
    def new
      @logo = Logo.new
    end

    # POST /logos
    # POST /logos.json
    def create
      @logo = @company.logos.new(logo_params)
      # binding.pry
      respond_to do |format|
        if @logo.save
          format.html { redirect_to logos_path, notice: 'Logo was successfully created.' }
          format.json { render action: 'show', status: :created, location: @logo }
        else
          format.html { render action: 'new' }
          format.json { render json: @logo.errors, status: :unprocessable_entity }
        end
      end
    end

    # def create_logo
    #   @logo = Logo.new(logo_params)
    #   if @logo.save
    #     redirect_to @authority, notice: "Logo successfully added!"
    #   else
    #     redirect_to @authority, alert: "Unable to add Logo!"
    #   end
    # end

    def create_logo_standalone
      @logo = Logo.new(logo_params)
      if @logo.save
        redirect_to logos_index_path, notice: "Logo successfully added!"
      else
        redirect_to logos_index_path, alert: "Unable to add Logo!"
      end
    end

    # PATCH/PUT /logos/1
    # PATCH/PUT /logos/1.json
    def update
      respond_to do |format|
        # binding.pry
        if @logo.update(logo_params)
          format.html { redirect_to @logo, notice: 'Logo was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @logo.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /logos/1
    # DELETE /logos/1.json
    def destroy
      @logo.destroy
      respond_to do |format|
        format.html { redirect_to logos_url }
        format.json { head :no_content }
      end
    end

    def destroy_standalone
      @logo=Logo.find(params[:id])
      @logo.destroy
      respond_to do |format|
        format.html { redirect_to logos_index_path }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_company
        @comapany = Company.find(params[:company_id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def logo_params
        params.require(:logo).permit(:file, :description)
      end

end

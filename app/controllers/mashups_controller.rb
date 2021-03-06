class MashupsController < ApplicationController
  before_action :set_mashup, only: [:show, :edit, :update, :destroy]
  before_action :sources, only: [:show]

  # GET /mashups
  def index
    @mashups = Array.new
    (json_params "mashup/mashups").first.last.each do |mashup|
      @mashups << Mashup.new(mashup)
    end
  end

  # GET /mashups/1
  def show
  end

  # GET /mashups/new
  def new
    @mashup = Mashup.new(json_params "mashup/mashups/new")
    redirect_to mashup_path(@mashup.id)
  end

  # POST /mashups
  def create
    @mashup = Mashup.new(json_create_mashup (params[:mashup][:name]))

    redirect_to mashup_path(@mashup.id)
  end

  # PATCH/PUT /mashups/1
  def update
    if (params.has_key? :new_param and params[:new_param].length > 0 ) 
      @mashup.parameters.push params[:new_param]
    else
      if params.has_key? :ids
        if params[:ids] == '0' 
          @mashup.parameters = Array.new
        else
          @mashup.parameters = @mashup.parameters[0..params[:ids].to_i-1]
        end
      end
    end
    @notice = ""
    old_mashup = @mashup
    begin
      @mashup = Mashup.new(json_update_mashup ({parameters: @mashup.parameters, sources: params[:source], name: mashup_params[:name]}))
    rescue Exception => e
      @notice = "Unable to find resources"
      @mashup = old_mashup
    end
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$ " << @notice
    respond_to do |format|
      format.js
    end
    
  end

  # DELETE /mashups/1
  def destroy
    user_id = @mashup.user_id
    json_destroy_mashup @mashup.id
    redirect_to user_path(user_id), notice: 'Mash up was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mashup
      #@mashup = Mashup.find(params[:id])
      @mashup = Mashup.new(json_params "mashup/mashups/#{params[:id]}")
    end

    # Only allow a trusted parameter "white list" through.
    def mashup_params
      params.require(:mashup).permit({parameters: []}, :name)
    end
end

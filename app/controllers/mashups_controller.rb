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

  # GET /mashups/1/edit
  def edit
  end

  # POST /mashups
  def create
    @mashup = Mashup.new(json_create_mashup (params[:mashup][:name]))

    redirect_to mashup_path(@mashup.id)
  end

  # PATCH/PUT /mashups/1
  def update
    if (mashup_params.has_key? :new_param ) 
      @mashup.parameters.push mashup_params[:new_param] if (mashup_params[:new_param].length > 0)
    else
      if mashup_params.has_key? :ids
        if mashup_params[:ids] == 0 
          @mashup.parameters = Array.new
        else
          @mashup.parameters = @mashup.parameters[0..mashup_params[:ids].to_i-1]
        end
      end
    end
      mashup = Mashup.new(json_update_mashup ({parameters: @mashup.parameters, sources: params[:source_ids], name: mashup_params[:name]}))

    @m = mashup
    render "cloud_tag", :layout => false

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
      params.require(:mashup).permit({parameters: []}, :ids, :name, :new_param)
    end
end

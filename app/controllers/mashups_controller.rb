class MashupsController < ApplicationController
  before_action :set_mashup, only: [:show, :edit, :update, :destroy]

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
    @mashup = Mashup.new
  end

  # GET /mashups/1/edit
  def edit
  end

  # POST /mashups
  def create
    @mashup = Mashup.new(mashup_params)

    if @mashup.save
      redirect_to @mashup, notice: 'Mash up was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /mashups/1
  def update
    @mashup.parameters.push mashup_params[:new_param]
    mashup = json_update_mashup @mashup.id, {parameters: @mashup.parameters}
    redirect_to mashup_path(@mashup.id), notice: 'Mash up was successfully updated1.'
  end

  # DELETE /mashups/1
  def destroy
    @mashup.destroy
    redirect_to mashups_url, notice: 'Mash up was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mashup
      #@mashup = Mashup.find(params[:id])
      @mashup = Mashup.new(json_params "mashup/mashups/#{params[:id]}")
    end

    # Only allow a trusted parameter "white list" through.
    def mashup_params
      params.require(:mashup).permit({parameters: []}, :name, :new_param, :cut_params)
    end
end

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
    @mashup.parameters << mashup_params[:new_param]
    mashup = @mashup.as_json(include: {:keywords => {}, :links => {include: {:link_source => {}}} })
    redirect_to mashup_path(mashup.id), notice: 'Mash up was successfully updated.'
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
      params.require(:mashup).permit(:parameters, :name, :new_param)
    end
end

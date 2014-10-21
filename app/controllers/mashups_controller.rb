class MashupsController < ApplicationController
  before_action :set_mashup, only: [:show, :edit, :update, :destroy]

  # GET /mashups
  def index
    @mashups = Mashup.all
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
    if @mashup.update(mashup_params)
      redirect_to @mashup, notice: 'Mash up was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mashups/1
  def destroy
    @mashup.destroy
    redirect_to mashups_url, notice: 'Mash up was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mashup
      @mashup = Mashup.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mashup_params
      params[:mashup]
    end
end

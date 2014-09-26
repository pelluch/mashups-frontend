class MashUpsController < ApplicationController
  before_action :set_mash_up, only: [:show, :edit, :update, :destroy]

  # GET /mash_ups
  def index
    @mash_ups = MashUp.all
  end

  # GET /mash_ups/1
  def show
  end

  # GET /mash_ups/new
  def new
    @mash_up = MashUp.new
  end

  # GET /mash_ups/1/edit
  def edit
  end

  # POST /mash_ups
  def create
    @mash_up = MashUp.new(mash_up_params)

    if @mash_up.save
      redirect_to @mash_up, notice: 'Mash up was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /mash_ups/1
  def update
    if @mash_up.update(mash_up_params)
      redirect_to @mash_up, notice: 'Mash up was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mash_ups/1
  def destroy
    @mash_up.destroy
    redirect_to mash_ups_url, notice: 'Mash up was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mash_up
      @mash_up = MashUp.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mash_up_params
      params[:mash_up]
    end
end

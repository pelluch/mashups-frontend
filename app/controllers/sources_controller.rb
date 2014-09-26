class SourcesController < ApplicationController
  before_action :set_source, only: [:show, :edit, :update, :destroy]

  # GET /sources
  def index
    @sources = Source.all
  end

  # GET /sources/1
  def show
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source
      @source = Source.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def source_params
      params[:source]
    end
end

class PlantiosController < ApplicationController
  before_action :set_plantio, only: [:show, :update, :destroy]

  # GET /plantios
  def index
    @plantios = Plantio.all

    render json: @plantios
  end

  # GET /plantios/1
  def show
    render json: @plantio
  end

  # POST /plantios
  def create
    @plantio = Plantio.new(plantio_params)

    if @plantio.save
      render json: @plantio, status: :created, location: @plantio
    else
      render json: @plantio.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /plantios/1
  def update
    if @plantio.update(plantio_params)
      render json: @plantio
    else
      render json: @plantio.errors, status: :unprocessable_entity
    end
  end

  # DELETE /plantios/1
  def destroy
    @plantio.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plantio
      @plantio = Plantio.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def plantio_params
      params.require(:plantio).permit(:dt_inicial, :dt_final, :areas_id, :fazendas_id, :cultivos_id, :status_plantios_id)
    end
end

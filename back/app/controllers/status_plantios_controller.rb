class StatusPlantiosController < ApplicationController
  before_action :set_status_plantio, only: [:show, :update, :destroy]

  # GET /status_plantios
  def index
    @status_plantios = StatusPlantio.all

    render json: @status_plantios
  end

  # GET /status_plantios/1
  def show
    render json: @status_plantio
  end

  # POST /status_plantios
  def create
    @status_plantio = StatusPlantio.new(status_plantio_params)

    if @status_plantio.save
      render json: @status_plantio, status: :created, location: @status_plantio
    else
      render json: @status_plantio.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /status_plantios/1
  def update
    if @status_plantio.update(status_plantio_params)
      render json: @status_plantio
    else
      render json: @status_plantio.errors, status: :unprocessable_entity
    end
  end

  # DELETE /status_plantios/1
  def destroy
    @status_plantio.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status_plantio
      @status_plantio = StatusPlantio.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def status_plantio_params
      params.require(:status_plantio).permit(:descricao)
    end
end

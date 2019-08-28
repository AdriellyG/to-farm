class CultivosController < ApplicationController
  before_action :set_cultivo, only: [:show, :update, :destroy]

  # GET /cultivos
  def index
    @cultivos = Cultivo.all

    render json: @cultivos
  end

  # GET /cultivos/1
  def show
    render json: @cultivo
  end

  # POST /cultivos
  def create
    @cultivo = Cultivo.new(cultivo_params)

    if @cultivo.save
      render json: @cultivo, status: :created, location: @cultivo
    else
      render json: @cultivo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cultivos/1
  def update
    if @cultivo.update(cultivo_params)
      render json: @cultivo
    else
      render json: @cultivo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cultivos/1
  def destroy
    @cultivo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cultivo
      @cultivo = Cultivo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cultivo_params
      params.require(:cultivo).permit(:nome, :tipo_cultivo_id, :fazenda_id)
    end
end

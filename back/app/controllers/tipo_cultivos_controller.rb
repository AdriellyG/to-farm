class TipoCultivosController < ApplicationController
  before_action :set_tipo_cultivo, only: [:show, :update, :destroy]

  # GET /tipo_cultivos
  def index
    @tipo_cultivos = TipoCultivo.all

    render json: @tipo_cultivos
  end

  # GET /tipo_cultivos/1
  def show
    render json: @tipo_cultivo
  end

  # POST /tipo_cultivos
  def create
    @tipo_cultivo = TipoCultivo.new(tipo_cultivo_params)

    if @tipo_cultivo.save
      render json: @tipo_cultivo, status: :created, location: @tipo_cultivo
    else
      render json: @tipo_cultivo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tipo_cultivos/1
  def update
    if @tipo_cultivo.update(tipo_cultivo_params)
      render json: @tipo_cultivo
    else
      render json: @tipo_cultivo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tipo_cultivos/1
  def destroy
    @tipo_cultivo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_cultivo
      @tipo_cultivo = TipoCultivo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tipo_cultivo_params
      params.permit(:nome)
    end
end

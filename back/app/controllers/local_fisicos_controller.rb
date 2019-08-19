class LocalFisicosController < ApplicationController
  before_action :set_local_fisico, only: [:show, :update, :destroy]

  # GET /local_fisicos
  def index
    @local_fisicos = LocalFisico.all

    render json: @local_fisicos
  end

  # GET /local_fisicos/1
  def show
    render json: @local_fisico
  end

  # POST /local_fisicos
  def create
    @local_fisico = LocalFisico.new(local_fisico_params)

    if @local_fisico.save
      render json: @local_fisico, status: :created, location: @local_fisico
    else
      render json: @local_fisico.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /local_fisicos/1
  def update
    if @local_fisico.update(local_fisico_params)
      render json: @local_fisico
    else
      render json: @local_fisico.errors, status: :unprocessable_entity
    end
  end

  # DELETE /local_fisicos/1
  def destroy
    @local_fisico.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_local_fisico
      @local_fisico = LocalFisico.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def local_fisico_params
      params.require(:local_fisico).permit(:nome, :descricao, :fazendas_id)
    end
end

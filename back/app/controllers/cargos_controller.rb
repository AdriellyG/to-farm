class CargosController < ApplicationController
  before_action :set_cargo, only: [:show, :update, :destroy]

  # GET /cargos
  def index
    @cargos = Cargo.all

    render json: @cargos
  end

  # GET /cargos/1
  def show
    render json: @cargo
  end

  # POST /cargos
  def create
    @cargo = Cargo.new(cargo_params)

    if @cargo.save
      render json: @cargo, status: :created, location: @cargo
    else
      render json: @cargo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cargos/1
  def update
    if @cargo.update(cargo_params)
      render json: @cargo
    else
      render json: @cargo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cargos/1
  def destroy
    @cargo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cargo
      @cargo = Cargo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cargo_params
      params.require(:cargo).permit(:nome, :descricao)
    end
end

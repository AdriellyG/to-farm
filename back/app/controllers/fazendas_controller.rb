class FazendasController < ApplicationController
  before_action :set_fazenda, only: [:show, :update, :destroy]

  # GET /fazendas
  def index
    @fazendas = Fazenda.all

    render json: @fazendas
  end

  # GET /fazendas/1
  def show
    render json: @fazenda
  end

  # POST /fazendas
  def create
    @fazenda = Fazenda.new(fazenda_params)

    if @fazenda.save
      render json: @fazenda, status: :created, location: @fazenda
    else
      render json: @fazenda.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fazendas/1
  def update
    if @fazenda.update(fazenda_params)
      render json: @fazenda
    else
      render json: @fazenda.errors, status: :unprocessable_entity
    end
  end

  # DELETE /fazendas/1
  def destroy
    @fazenda.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fazenda
      @fazenda = Fazenda.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fazenda_params
      params.require(:fazenda).permit(:nome, :rua, :numero, :cep, :estado, :cidade, :pessoa_id)
    end
end

class TipoMovimentacaosController < ApplicationController
  before_action :set_tipo_movimentacao, only: [:show, :update, :destroy]

  # GET /tipo_movimentacaos
  def index
    @tipo_movimentacaos = TipoMovimentacao.all

    render json: @tipo_movimentacaos
  end

  # GET /tipo_movimentacaos/1
  def show
    render json: @tipo_movimentacao
  end

  # POST /tipo_movimentacaos
  def create
    @tipo_movimentacao = TipoMovimentacao.new(tipo_movimentacao_params)

    if @tipo_movimentacao.save
      render json: @tipo_movimentacao, status: :created, location: @tipo_movimentacao
    else
      render json: @tipo_movimentacao.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tipo_movimentacaos/1
  def update
    if @tipo_movimentacao.update(tipo_movimentacao_params)
      render json: @tipo_movimentacao
    else
      render json: @tipo_movimentacao.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tipo_movimentacaos/1
  def destroy
    @tipo_movimentacao.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_movimentacao
      @tipo_movimentacao = TipoMovimentacao.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tipo_movimentacao_params
      params.require(:tipo_movimentacao).permit(:nome, :descricao)
    end
end

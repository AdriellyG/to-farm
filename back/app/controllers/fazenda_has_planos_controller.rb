class FazendaHasPlanosController < ApplicationController
  before_action :set_fazenda_has_plano, only: [:show, :update, :destroy]

  # GET /fazenda_has_planos
  def index
    @fazenda_has_planos = FazendaHasPlano.all

    render json: @fazenda_has_planos
  end

  # GET /fazenda_has_planos/1
  def show
    render json: @fazenda_has_plano
  end

  # POST /fazenda_has_planos
  def create
    @fazenda_has_plano = FazendaHasPlano.new(fazenda_has_plano_params)

    if @fazenda_has_plano.save
      render json: @fazenda_has_plano, status: :created, location: @fazenda_has_plano
    else
      render json: @fazenda_has_plano.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fazenda_has_planos/1
  def update
    if @fazenda_has_plano.update(fazenda_has_plano_params)
      render json: @fazenda_has_plano
    else
      render json: @fazenda_has_plano.errors, status: :unprocessable_entity
    end
  end

  # DELETE /fazenda_has_planos/1
  def destroy
    @fazenda_has_plano.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fazenda_has_plano
      @fazenda_has_plano = FazendaHasPlano.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fazenda_has_plano_params
      params.require(:fazenda_has_plano).permit(:dt_inicio, :fazenda_id, :plano_id, :ativo)
    end
end

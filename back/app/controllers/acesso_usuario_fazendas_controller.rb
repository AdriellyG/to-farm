class AcessoUsuarioFazendasController < ApplicationController
  before_action :set_acesso_usuario_fazenda, only: [:show, :update, :destroy]

  # GET /acesso_usuario_fazendas
  def index
    @acesso_usuario_fazendas = AcessoUsuarioFazenda.all

    render json: @acesso_usuario_fazendas
  end

  # GET /acesso_usuario_fazendas/1
  def show
    render json: @acesso_usuario_fazenda
  end

  # POST /acesso_usuario_fazendas
  def create
    @acesso_usuario_fazenda = AcessoUsuarioFazenda.new(acesso_usuario_fazenda_params)

    if @acesso_usuario_fazenda.save
      render json: @acesso_usuario_fazenda, status: :created, location: @acesso_usuario_fazenda
    else
      render json: @acesso_usuario_fazenda.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /acesso_usuario_fazendas/1
  def update
    if @acesso_usuario_fazenda.update(acesso_usuario_fazenda_params)
      render json: @acesso_usuario_fazenda
    else
      render json: @acesso_usuario_fazenda.errors, status: :unprocessable_entity
    end
  end

  # DELETE /acesso_usuario_fazendas/1
  def destroy
    @acesso_usuario_fazenda.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acesso_usuario_fazenda
      @acesso_usuario_fazenda = AcessoUsuarioFazenda.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def acesso_usuario_fazenda_params
      params.require(:acesso_usuario_fazenda).permit(:usuarios_id, :fazendas_id)
    end
end

class PessoaJuridicasController < ApplicationController
  before_action :set_pessoa_juridica, only: [:show, :update, :destroy]

  # GET /pessoa_juridicas
  def index
    @pessoa_juridicas = PessoaJuridica.all

    render json: @pessoa_juridicas
  end

  # GET /pessoa_juridicas/1
  def show
    render json: @pessoa_juridica
  end

  # POST /pessoa_juridicas
  def create
    @pessoa_juridica = PessoaJuridica.new(pessoa_juridica_params)

    if @pessoa_juridica.save
      render json: @pessoa_juridica, status: :created, location: @pessoa_juridica
    else
      render json: @pessoa_juridica.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pessoa_juridicas/1
  def update
    if @pessoa_juridica.update(pessoa_juridica_params)
      render json: @pessoa_juridica
    else
      render json: @pessoa_juridica.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pessoa_juridicas/1
  def destroy
    @pessoa_juridica.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pessoa_juridica
      @pessoa_juridica = PessoaJuridica.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pessoa_juridica_params
      params.require(:pessoa_juridica).permit(:cnpj, :pessoa_id)
    end
end

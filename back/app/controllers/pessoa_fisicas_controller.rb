class PessoaFisicasController < ApplicationController
  before_action :set_pessoa_fisica, only: [:show, :update, :destroy]

  # GET /pessoa_fisicas
  def index
    @pessoa_fisicas = PessoaFisica.all

    render json: @pessoa_fisicas
  end

  # GET /pessoa_fisicas/1
  def show
    render json: @pessoa_fisica
  end

  # POST /pessoa_fisicas
  def create
    @pessoa_fisica = PessoaFisica.new(pessoa_fisica_params)

    if @pessoa_fisica.save
      render json: @pessoa_fisica, status: :created, location: @pessoa_fisica
    else
      render json: @pessoa_fisica.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pessoa_fisicas/1
  def update
    if @pessoa_fisica.update(pessoa_fisica_params)
      render json: @pessoa_fisica
    else
      render json: @pessoa_fisica.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pessoa_fisicas/1
  def destroy
    @pessoa_fisica.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pessoa_fisica
      @pessoa_fisica = PessoaFisica.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pessoa_fisica_params
      params.require(:pessoa_fisica).permit(:cpf, :pessoa_id)
    end
end

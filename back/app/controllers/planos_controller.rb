class PlanosController < ApplicationController
  before_action :set_plano, only: [:show, :update, :destroy]

  # GET /planos
  def index
    @planos = Plano.all

    render json: @planos
  end

  # GET /planos/1
  def show
    render json: @plano
  end

  # POST /planos
  def create
    @plano = Plano.new(plano_params)

    if @plano.save
      render json: @plano, status: :created, location: @plano
    else
      render json: @plano.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /planos/1
  def update
    if @plano.update(plano_params)
      render json: @plano
    else
      render json: @plano.errors, status: :unprocessable_entity
    end
  end

  # DELETE /planos/1
  def destroy
    @plano.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plano
      @plano = Plano.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def plano_params
      params.require(:plano).permit(:nome, :valor)
    end
end

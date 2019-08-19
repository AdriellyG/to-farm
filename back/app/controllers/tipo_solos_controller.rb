class TipoSolosController < ApplicationController
  before_action :set_tipo_solo, only: [:show, :update, :destroy]

  # GET /tipo_solos
  def index
    @tipo_solos = TipoSolo.all

    render json: @tipo_solos
  end

  # GET /tipo_solos/1
  def show
    render json: @tipo_solo
  end

  # POST /tipo_solos
  def create
    @tipo_solo = TipoSolo.new(tipo_solo_params)

    if @tipo_solo.save
      render json: @tipo_solo, status: :created, location: @tipo_solo
    else
      render json: @tipo_solo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tipo_solos/1
  def update
    if @tipo_solo.update(tipo_solo_params)
      render json: @tipo_solo
    else
      render json: @tipo_solo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tipo_solos/1
  def destroy
    @tipo_solo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_solo
      @tipo_solo = TipoSolo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tipo_solo_params
      params.require(:tipo_solo).permit(:nome, :acidez)
    end
end

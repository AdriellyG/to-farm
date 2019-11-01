class UsuariosController < ApplicationController
  skip_before_action :authorize_request, only: :create
  before_action :set_usuario, only: [:show, :update, :destroy]

  # GET /usuarios
  def index
    @usuarios = Usuario.all

    render json: @usuarios
  end

  # GET /usuarios/1
  def show
    render json: @usuario
  end

  # Retorna autenticado quando está logado
  def create
    @usuario = Usuario.create!(usuario_params)
    auth_token = AuthenticateUsuario.new(@usuario.email, @usuario.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end



  # POST /usuarios
  # def create
  #   @usuario = Usuario.new(usuario_params)

  #   if @usuario.save
  #     render json: @usuario, status: :created, location: @usuario
  #   else
  #     render json: @usuario.errors, status: :unprocessable_entity
  #   end
  # end

  # PATCH/PUT /usuarios/1
  def update
    if @usuario.update(usuario_params)
      render json: @usuario
    else
      render json: @usuario.errors, status: :unprocessable_entity
    end
  end

  # DELETE /usuarios/1
  def destroy
    @usuario.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def usuario_params
      params.require(:usuario).permit(:email, :password, :password_confirmation, :pessoa_fisica_id)
    end
end

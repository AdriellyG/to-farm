class AuthenticationController < ApplicationController
    skip_before_action :authorize_request, only: :authenticate

    # Retorna auth token apenas se o usuário estiver autenticado
    def authenticate
      auth_token =
        AuthenticateUsuario.new(auth_params[:email], auth_params[:password]).call
      json_response(auth_token: auth_token)
    end
  
    private
  
    def auth_params
      params.permit(:email, :password)
    end
  end
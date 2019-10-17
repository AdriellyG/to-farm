class ApplicationController < ActionController::API
    include Response
    #include ExceptionHandler

    # Chamado depois de cada ação do controller
    before_action :authorize_request
    attr_reader :current_usuario

    private

    # Checa se requisição do token é válida e retorna usuário
    def authorize_request
        @current_usuario = (AuthorizeApiRequest.new(request.headers).call)[:usuario]
    end
end

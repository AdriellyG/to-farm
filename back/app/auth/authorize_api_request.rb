class AuthorizeApiRequest
    def initialize(headers = {})
      @headers = headers
    end
  
    # Service entry point - retorna usuario válido
    def call
      {
        usuario: usuario
      }
    end
  
    private
  
    attr_reader :headers
  
    def usuario
      # confere se usuário está cadastrado
      @usuario ||= Usuario.find(decoded_auth_token[:usuario_id]) if decoded_auth_token
      # usuário não encontrado
    rescue ActiveRecord::RecordNotFound => e
      # Retorna mensagem de erro
      raise(
        ExceptionHandler::InvalidToken,
        ("#{Message.invalid_token} #{e.message}")
      )
    end
  
    # decodifica token de autenticação
    def decoded_auth_token
      @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
    end
  
    # Checa token em no cabeçalho 'Authorization'
    def http_auth_header
      if headers['Authorization'].present?
        return headers['Authorization'].split(' ').last
      end
        raise(ExceptionHandler::MissingToken, Message.missing_token)
    end
  end
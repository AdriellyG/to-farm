class AuthenticateUsuario
    def initialize(email, password)
      @email = email
      @password = password
    end
  
    # Service entry point
    def call
      JsonWebToken.encode(usuario_id: usuario.id) if usuario
    end
  
    private
  
    attr_reader :email, :password
  
    # Verifica credenciais do usuário
    def usuario
      usuario = Usuario.find_by(email: email)
      
      return usuario if usuario && usuario.authenticate(password)
      # retorna erro se credenciais forem inválidas
      raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
    end
  end
class Message
    def self.not_found(record = 'record')
      "Desculpe, #{record} não encontrado."
    end
  
    def self.invalid_credentials
      'Credenciais inválidas.'
    end
  
    def self.invalid_token
      'Token inválido.'
    end
  
    def self.missing_token
      'Token não encontrado.'
    end
  
    def self.unauthorized
      'Requisição não autorizada.'
    end
  
    def self.account_created
      'Conta criada com sucesso.'
    end
  
    def self.account_not_created
      'Não foi possível cadastrar nova conta.'
    end
  
    def self.expired_token
      'Desculpe, seu token expirou. Por favor, efetue o login novamente para continuar.'
    end
  end
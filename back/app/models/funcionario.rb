class Funcionario < ApplicationRecord
  belongs_to :cargos
  belongs_to :usuarios
end

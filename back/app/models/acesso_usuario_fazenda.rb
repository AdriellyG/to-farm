class AcessoUsuarioFazenda < ApplicationRecord
  belongs_to :usuarios
  belongs_to :fazendas
end

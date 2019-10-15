class AcessoUsuarioFazenda < ApplicationRecord
  belongs_to :usuarios, class_name: "Usuario", optional: true
  belongs_to :fazendas, class_name: "Fazenda", optional: true
end

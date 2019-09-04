class Funcionario < ApplicationRecord
  belongs_to :cargos, class_name: "Cargo", optional: true
  belongs_to :usuarios, class_name: "Usuario", optional: true
end

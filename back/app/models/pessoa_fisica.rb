class PessoaFisica < ApplicationRecord
  belongs_to :pessoa, class_name: "Pessoa", optional: true

  has_one :usuario
end

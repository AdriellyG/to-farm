class PessoaFisica < ApplicationRecord
  belongs_to :pessoa
  has_one :usuario
end

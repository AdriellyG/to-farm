class Usuario < ApplicationRecord
  belongs_to :pessoa_fisica, class_name: "PessoaFisica", optional: true
  
  has_one :funcionario
end
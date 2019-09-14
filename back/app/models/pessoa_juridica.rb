class PessoaJuridica < ApplicationRecord
  belongs_to :pessoa, class_name: "Pessoa", optional: true
end

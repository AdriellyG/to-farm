class Usuario < ApplicationRecord
  belongs_to :pessoa_fisica
  has_one :funcionario
end

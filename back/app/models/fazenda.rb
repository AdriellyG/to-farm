class Fazenda < ApplicationRecord
  belongs_to :pessoa
  has_many :local_fisico
end

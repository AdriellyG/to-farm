class Fazenda < ApplicationRecord
  belongs_to :pessoa
  has_many :local_fisicos
  has_many :areas
end

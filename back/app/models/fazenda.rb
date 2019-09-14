class Fazenda < ApplicationRecord
  belongs_to :pessoa, class_name: "Pessoa", optional: true
  
  has_many :local_fisicos
  has_many :areas
end

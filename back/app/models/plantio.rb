class Plantio < ApplicationRecord
  belongs_to :areas
  belongs_to :fazendas
  belongs_to :cultivos
  belongs_to :status_plantios
end

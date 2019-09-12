class Cultivo < ApplicationRecord
  belongs_to :tipo_cultivos
  belongs_to :fazendas
end

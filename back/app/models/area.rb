class Area < ApplicationRecord
  belongs_to :fazendas
  belongs_to :tipo_solos
  belongs_to :local_fisicos
end

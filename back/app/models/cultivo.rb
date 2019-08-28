class Cultivo < ApplicationRecord
  belongs_to :tipo_cultivos, class_name: "TipoCultivo", optional: true
  belongs_to :fazendas, class_name: "Fazenda", optional: true
end

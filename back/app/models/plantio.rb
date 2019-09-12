class Plantio < ApplicationRecord
  belongs_to :areas, class_name: "Area", optional: true
  belongs_to :fazendas, class_name: "Fazenda", optional: true
  belongs_to :cultivos, class_name: "Cultivo", optional: true
  belongs_to :status_plantios, class_name: "StatusPlantio", optional: true
end

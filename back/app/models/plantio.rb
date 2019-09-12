class Plantio < ApplicationRecord
  belongs_to :area, class_name: "Area", optional: true
  belongs_to :fazenda, class_name: "Fazenda", optional: true
  belongs_to :cultivo, class_name: "Cultivo", optional: true
  belongs_to :status_plantio, class_name: "StatusPlantio", optional: true
end
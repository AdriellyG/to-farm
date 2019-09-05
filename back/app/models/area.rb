class Area < ApplicationRecord
  belongs_to :fazendas,      class_name: "Fazenda", optional: true
  belongs_to :tipo_solos,    class_name: "TipoSolo", optional: true
  belongs_to :local_fisicos, class_name: "LocalFisico", optional: true
end

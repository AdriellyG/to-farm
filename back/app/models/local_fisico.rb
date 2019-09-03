class LocalFisico < ApplicationRecord
  belongs_to :fazendas, class_name: "Fazenda", optional: true
end

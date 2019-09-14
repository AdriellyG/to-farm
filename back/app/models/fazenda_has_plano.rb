class FazendaHasPlano < ApplicationRecord
  belongs_to :fazenda, class_name: "Fazenda", optional: true
end

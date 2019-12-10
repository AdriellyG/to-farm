class LocalFisico < ApplicationRecord
  belongs_to :fazendas, class_name: "Fazenda", optional: true

  def self.local_is_used(id)
    sql = "
      select 1 as existe
      from areas a
      where a.local_fisico_id = #{id}"
  
    sql = ActiveRecord::Base.connection.select_all(sql)
  end
end

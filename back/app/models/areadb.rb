class Areadb < ActiveRecord::Base
    self.table_name = 'areas'
    self.primary_key = 'id'
    
    def self.get_areas
        sql = "
        SELECT 
            a.*,
            b.nome as local,
            c.nome as tipo_solo
        FROM
            areas a
        inner join local_fisicos b on ( a.local_fisico_id = b.id )
        inner join tipo_solos c on ( a.tipo_solo_id = c.id )"
  
        sql = ActiveRecord::Base.connection.select_all(sql)
    end
  end
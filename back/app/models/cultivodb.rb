class Cultivodb < ActiveRecord::Base
    self.table_name = 'cultivos'
    self.primary_key = 'id'
    
    def self.get_cultivos
        sql = "
        SELECT 
            a.*,
            c.nome as tipo_cultivo
        FROM
            cultivos a
        inner join tipo_cultivos c on ( a.tipo_cultivos_id = c.id )"
  
        sql = ActiveRecord::Base.connection.select_all(sql)
    end
  end
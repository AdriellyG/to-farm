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

    def self.get_areas_total_usadas
        sql = "
        select count(a.id) as total
            from areas a
            left join plantios p on ( a.id = p.areas_id )
            where p.areas_id is not null"
  
        sql = ActiveRecord::Base.connection.select_all(sql)
    end

    def self.get_areas_total_usadas
        sql = "
        select count(s.total) as total
        from(
            select distinct a.id as total
            from areas a
            inner join plantios p on ( a.id = p.areas_id )
            where p.areas_id is not null
        ) s"
  
        sql = ActiveRecord::Base.connection.select_all(sql)
    end

    def self.get_areas_total_disponiveis
        sql = "
        select count(a.id) as total
            from areas a
            left join plantios p on ( a.id = p.areas_id )
            where p.areas_id is null"
  
        sql = ActiveRecord::Base.connection.select_all(sql)
    end

    def self.get_areas_total
        sql = "
        select count(a.id) as total
            from areas a"
  
        sql = ActiveRecord::Base.connection.select_all(sql)
    end

  end
class Plantiodb < ActiveRecord::Base
    self.table_name = 'plantios'
    self.primary_key = 'id'
    
    def self.get_all
        sql = "
        SELECT 
            p.id,
            to_char(p.dt_inicial, 'DD/MM/YYYY') as dt_inicial,
            to_char(p.dt_final, 'DD/MM/YYYY') as dt_final,
            s.descricao as status,
            c.nome as cultivo,
            a.nome as area
        FROM
            plantios p
        inner join status_plantios s on ( p.status_plantio_id = s.id )
        inner join areas           a on ( p.areas_id          = a.id )
        inner join cultivos        c on ( p.cultivos_id       = c.id )"
  
        sql = ActiveRecord::Base.connection.select_all(sql)
    end
end
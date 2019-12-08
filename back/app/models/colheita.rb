class Colheita < ActiveRecord::Base
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

    def self.get_month
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
        inner join cultivos        c on ( p.cultivos_id       = c.id )
        where extract(month from cast('now' as timestamp)) = extract(month from cast(p.dt_inicial as date))"
  
        sql = ActiveRecord::Base.connection.select_all(sql)
    end

    def self.get_week
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
        inner join cultivos        c on ( p.cultivos_id       = c.id )
        where extract(week from cast('now' as timestamp)) = extract(week from cast(p.dt_inicial as date))"

        sql = ActiveRecord::Base.connection.select_all(sql)
    end

    def self.get_year
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
        inner join cultivos        c on ( p.cultivos_id       = c.id )
        where extract(year from cast('now' as timestamp)) = extract(year from cast(p.dt_inicial as date))"

        sql = ActiveRecord::Base.connection.select_all(sql)
    end

    def self.get_day
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
        inner join cultivos        c on ( p.cultivos_id       = c.id )
        where extract(day from cast('now' as timestamp)) = extract(day from cast(p.dt_inicial as date))"
        
        sql = ActiveRecord::Base.connection.select_all(sql)
    end

    def self.get_by_filter(params)
    end
end
class ColheitasController < ApplicationController
    def index
        @colheitas = Colheita.get_all
    
        render json: @colheitas
    end

    def get_week
        @colheitas = Colheita.get_week
    
        render json: @colheitas
    end

    def get_day
        @colheitas = Colheita.get_day
    
        render json: @colheitas
    end

    def get_month
        @colheitas = Colheita.get_month
    
        render json: @colheitas
    end

    def get_year
        @colheitas = Colheita.get_year
    
        render json: @colheitas
    end
end

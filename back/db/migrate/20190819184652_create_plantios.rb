class CreatePlantios < ActiveRecord::Migration[5.2]
  def change
    create_table :plantios do |t|
      t.date :dt_inicial
      t.date :dt_final
      t.references :areas, foreign_key: true
      t.references :fazendas, foreign_key: true
      t.references :cultivos, foreign_key: true
      t.references :status_plantios, foreign_key: true

      t.timestamps
    end
  end
end

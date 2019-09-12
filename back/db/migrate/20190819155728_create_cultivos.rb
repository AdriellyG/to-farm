class CreateCultivos < ActiveRecord::Migration[5.2]
  def change
    create_table :cultivos do |t|
      t.string :nome
      t.references :tipo_cultivos, foreign_key: true
      t.references :fazendas, foreign_key: true

      t.timestamps
    end
  end
end

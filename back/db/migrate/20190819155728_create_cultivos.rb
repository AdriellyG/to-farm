class CreateCultivos < ActiveRecord::Migration[5.2]
  def change
    create_table :cultivos do |t|
      t.string :nome
      t.references :tipo_cultivo, foreign_key: true
      t.references :fazenda, foreign_key: true

      t.timestamps
    end
  end
end

class CreateLocalFisicos < ActiveRecord::Migration[5.2]
  def change
    create_table :local_fisicos do |t|
      t.string :nome
      t.string :descricao
      t.references :fazendas, foreign_key: true

      t.timestamps
    end
  end
end

class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :nome
      t.references :fazendas, foreign_key: true
      t.references :tipo_solos, foreign_key: true
      t.references :local_fisicos, foreign_key: true

      t.timestamps
    end
  end
end

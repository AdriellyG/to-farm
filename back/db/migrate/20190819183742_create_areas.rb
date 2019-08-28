class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :nome
      t.references :fazenda, foreign_key: true
      t.references :tipo_solo, foreign_key: true
      t.references :local_fisico, foreign_key: true

      t.timestamps
    end
  end
end

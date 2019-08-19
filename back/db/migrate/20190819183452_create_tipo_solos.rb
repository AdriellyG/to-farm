class CreateTipoSolos < ActiveRecord::Migration[5.2]
  def change
    create_table :tipo_solos do |t|
      t.string :nome
      t.float :acidez

      t.timestamps
    end
  end
end

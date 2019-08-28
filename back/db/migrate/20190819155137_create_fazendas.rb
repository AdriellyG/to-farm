class CreateFazendas < ActiveRecord::Migration[5.2]
  def change
    create_table :fazendas do |t|
      t.string :nome
      t.string :rua
      t.string :numero
      t.integer :cep
      t.string :estado
      t.string :cidade
      t.references :pessoa, foreign_key: true

      t.timestamps
    end
  end
end

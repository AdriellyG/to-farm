class CreateTipoCultivos < ActiveRecord::Migration[5.2]
  def change
    create_table :tipo_cultivos do |t|
      t.string :nome
      t.boolean :ativo

      t.timestamps
    end
  end
end

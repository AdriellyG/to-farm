class CreateTipoMovimentacaos < ActiveRecord::Migration[5.2]
  def change
    create_table :tipo_movimentacaos do |t|
      t.string :nome
      t.string :descricao

      t.timestamps
    end
  end
end

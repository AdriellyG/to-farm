class CreateFazendaHasPlanos < ActiveRecord::Migration[5.2]
  def change
    create_table :fazenda_has_planos do |t|
      t.date :dt_inicio
      t.references :fazenda, foreign_key: true
      t.references :plano,   foreign_key: true
      t.boolean :ativo

      t.timestamps
    end
  end
end

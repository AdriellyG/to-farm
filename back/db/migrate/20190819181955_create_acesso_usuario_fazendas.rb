class CreateAcessoUsuarioFazendas < ActiveRecord::Migration[5.2]
  def change
    create_table :acesso_usuario_fazendas do |t|
      t.references :usuario, foreign_key: true
      t.references :fazenda, foreign_key: true

      t.timestamps
    end
  end
end

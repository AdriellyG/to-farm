class CreateAcessoUsuarioFazendas < ActiveRecord::Migration[5.2]
  def change
    create_table :acesso_usuario_fazendas do |t|
      t.references :usuarios, foreign_key: true
      t.references :fazendas, foreign_key: true

      t.timestamps
    end
  end
end

class CreatePessoaJuridicas < ActiveRecord::Migration[5.2]
  def change
    create_table :pessoa_juridicas do |t|
      t.string :cnpj
      t.references :pessoa, foreign_key: true

      t.timestamps
    end
  end
end

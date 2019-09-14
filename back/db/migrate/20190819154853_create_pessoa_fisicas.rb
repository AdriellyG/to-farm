class CreatePessoaFisicas < ActiveRecord::Migration[5.2]
  def change
    create_table :pessoa_fisicas do |t|
      t.string :cpf
      t.references :pessoas, foreign_key: true

      t.timestamps
    end
  end
end

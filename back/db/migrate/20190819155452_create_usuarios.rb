class CreateUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :usuarios do |t|
      t.string :email
      t.string :senha
      t.references :pessoa_fisica, foreign_key: true

      t.timestamps
    end
  end
end

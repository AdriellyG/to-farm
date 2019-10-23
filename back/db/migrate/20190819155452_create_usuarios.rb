class CreateUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :usuarios do |t|
      t.string :email
      t.references :pessoa_fisicas, foreign_key: true

      t.timestamps
    end
    add_index :usuarios, :email, unique: true
  end
end

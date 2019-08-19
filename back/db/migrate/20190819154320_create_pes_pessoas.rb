class CreatePesPessoas < ActiveRecord::Migration[5.2]
  def change
    create_table :pes_pessoas do |t|
      t.string :nome

      t.timestamps
    end
  end
end

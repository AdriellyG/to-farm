class CreatePlanos < ActiveRecord::Migration[5.2]
  def change
    create_table :planos do |t|
      t.string :nome
      t.float :valor

      t.timestamps
    end
  end
end

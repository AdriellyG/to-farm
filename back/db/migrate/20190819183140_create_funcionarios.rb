class CreateFuncionarios < ActiveRecord::Migration[5.2]
  def change
    create_table :funcionarios do |t|
      t.references :cargo, foreign_key: true
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end

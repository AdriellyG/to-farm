class CreateFuncionarios < ActiveRecord::Migration[5.2]
  def change
    create_table :funcionarios do |t|
      t.references :cargos, foreign_key: true
      t.references :usuarios, foreign_key: true

      t.timestamps
    end
  end
end

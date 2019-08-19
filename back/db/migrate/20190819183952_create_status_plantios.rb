class CreateStatusPlantios < ActiveRecord::Migration[5.2]
  def change
    create_table :status_plantios do |t|
      t.string :descricao

      t.timestamps
    end
  end
end

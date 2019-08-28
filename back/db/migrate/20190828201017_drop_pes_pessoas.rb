class DropPesPessoas < ActiveRecord::Migration[5.2]
  def up
    drop_table :pes_pessoas
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end

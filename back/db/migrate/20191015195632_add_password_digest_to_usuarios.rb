class AddPasswordDigestToUsuarios < ActiveRecord::Migration[5.2]
  def change
    add_column :usuarios, :password_digest, :string
  end
end

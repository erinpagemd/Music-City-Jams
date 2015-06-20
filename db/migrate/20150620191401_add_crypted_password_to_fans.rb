class AddCryptedPasswordToFans < ActiveRecord::Migration
  def change
    add_column :fans, :crypted_password, :string
    add_column :fans, :salt, :string

    add_index :fans, :email, unique: true
  end
end

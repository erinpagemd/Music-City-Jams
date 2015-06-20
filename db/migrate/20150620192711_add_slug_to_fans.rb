class AddSlugToFans < ActiveRecord::Migration
  def change
    add_column :fans, :slug, :string
  end
end

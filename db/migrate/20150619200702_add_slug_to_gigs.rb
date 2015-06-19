class AddSlugToGigs < ActiveRecord::Migration
  def change
    add_column :gigs, :slug, :string
  end
end

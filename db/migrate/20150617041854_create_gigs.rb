class CreateGigs < ActiveRecord::Migration
  def change
    create_table :gigs do |t|
      t.string :name
      t.string :location
      t.date :date
      t.text :description
      t.string :image

      t.timestamps null: false
    end
  end
end

class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :gig, index: true, foreign_key: true
      t.references :user, index:true
      t.string :body

      t.timestamps null: false
    end
  end
end

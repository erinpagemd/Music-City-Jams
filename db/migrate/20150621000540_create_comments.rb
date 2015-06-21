class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.gig :reference
      t.user :reference
      t.string :body

      t.timestamps null: false
    end
  end
end

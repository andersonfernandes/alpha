class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :text, null: false
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end

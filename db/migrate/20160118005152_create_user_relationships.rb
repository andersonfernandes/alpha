class CreateUserRelationships < ActiveRecord::Migration
  def change
    create_table :user_relationships do |t|
      t.references :follower, index: true, null: false
      t.references :followed, index: true, null: false

      t.timestamps null: false
    end

    add_foreign_key :user_relationships, :users, column: :follower_id
    add_foreign_key :user_relationships, :users, column: :followed_id
  end
end

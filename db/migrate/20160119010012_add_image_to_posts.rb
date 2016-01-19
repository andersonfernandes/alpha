class AddImageToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :image_id, :string
    add_column :posts, :image_filename, :string
    add_column :posts, :image_size, :integer
    add_column :posts, :image_content_type, :string
  end
end

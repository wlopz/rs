class AddAuthorIdToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :author_id, :integer
    add_index :blogs, :author_id
  end
end

class AddPublishedToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :published, :boolean, default: false
    add_column :blogs, :published_at, :datetime
  end
end

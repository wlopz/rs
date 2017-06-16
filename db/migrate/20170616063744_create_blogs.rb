class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :body
      t.text :description
      t.string :slug

      t.timestamps
    end
    add_index :blogs, :slug, unique: true
  end
end

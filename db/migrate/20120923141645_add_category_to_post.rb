class AddCategoryToPost < ActiveRecord::Migration
  def change
    add_column :posts, :category_id, :integer
    add_column :posts, :picture_number, :integer
  end
end

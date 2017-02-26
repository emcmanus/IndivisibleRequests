class AddCommentsCountToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :comments_count, :integer, null: 0, default: 0
  end
end

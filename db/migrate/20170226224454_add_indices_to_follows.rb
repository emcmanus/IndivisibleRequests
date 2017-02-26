class AddIndicesToFollows < ActiveRecord::Migration[5.0]
  def change
    add_index :follows, [:user_id, :post_id], unique: true
  end
end

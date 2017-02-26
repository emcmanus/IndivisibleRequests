class AddDeletedAtToFollow < ActiveRecord::Migration[5.0]
  def change
    add_column :follows, :deleted_at, :datetime
    add_index :follows, :deleted_at
  end
end

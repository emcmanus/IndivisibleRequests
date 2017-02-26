class CreateFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :follows do |t|
      t.references :user, foreign_key: true, null: false
      t.references :post, foreign_key: true, null: false
    end
  end
end

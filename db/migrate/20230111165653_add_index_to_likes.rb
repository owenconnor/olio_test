class AddIndexToLikes < ActiveRecord::Migration[7.0]
  def change
    add_index :likes, :liked_item_id
  end
end

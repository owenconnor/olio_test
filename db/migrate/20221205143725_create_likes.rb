class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :liked_item_id
      t.string  :liked_item_type

      t.timestamps
    end
  end
end
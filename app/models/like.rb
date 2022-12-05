class Like < ApplicationRecord
  validates :liked_item_id, :liked_item_type, presence: true
  validates :liked_item_id, numericality: { only_integer: true }
  validates :liked_item_type, inclusion: { in: %w[olio_item] }
end

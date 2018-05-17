class Review < ApplicationRecord
  belongs_to :cocktail
  validates :rating, numericality: {only_integer: true}, inclusion: { in: [0, 1, 2, 3, 4, 5] }
  validates :cocktail_id, presence: true
  validates :content, presence: true
end

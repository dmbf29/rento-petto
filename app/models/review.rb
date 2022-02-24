class Review < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  validates :content, presence: true
  validates :rating, presence: true
end

class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true, length: { minimum: 2 }
  validates :description, presence: true
  validates :species, presence: true
  validates :breed, presence: true
  validates :price, presence: true, numericality: { only_integer: true }, allow_blank: false
end

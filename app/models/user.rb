class User < ApplicationRecord
  # Associations
  has_many :bookings # as renter
  has_many :pets
  has_many :bookings_as_owner, through: :pets, source: :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
end

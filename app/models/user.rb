class User < ApplicationRecord
  # Associations test
  has_many :bookings # as renter
  has_many :pets
  has_many :reviews, dependent: :destroy
  has_many :bookings_as_owner, through: :pets, source: :bookings
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
end

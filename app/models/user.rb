class User < ApplicationRecord
  has_many :bookings # as renter
  has_many :pets
  has_many :bookings_as_owner, through: :pets, source: :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end

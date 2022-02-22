# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require_relative 'seeds_helper'

# destroy all instances
Booking.destroy_all
Pet.destroy_all
User.destroy_all

# create random instances
create_users(10)
create_pets(30)
create_bookings # creates for each randomly generated user 1 booking

# create admin users (will be assigned later)
# admin as well as ourselves
puts "\n...create admin users!"
User.create!(first_name: "admin", last_name: "admin", password: "123456", email:"admin@admin.com")
User.create!(first_name: "risako", last_name: "nagai", password: "123456", email:"risako@nagai.com")
User.create!(first_name: "taylor", last_name: "mravic", password: "123456", email:"taylor@mravic.com")
User.create!(first_name: "doug", last_name: "theman", password: "123456", email:"doug@theman.com")
User.create!(first_name: "trouni", last_name: "assassin", password: "123456", email:"trouni@assassin.com")

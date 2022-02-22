# creates n random users and saves them in the db
def create_users(n)
  puts "creating #{n} random users!"
  n.times do |count|
    full = Faker::Name.name
    User.create!(
      first_name: full.split[0],
      last_name: full.split[1],
      email: Faker::Internet.email,
      password: Faker::Internet.password(6, 12),
    )
    print "*"
    print "\n" if (count + 1) % 10 == 0
  end
end

# creates n random pets and saves them in the db
def create_pets(n)
  puts "creating #{n} random pets!"
  n.times do |count|
    p = Pet.new(
      title: Faker::FunnyName.name,
      description: 'the best pet ever',
      location: addresses.sample,
      species: ['cats', 'dogs', 'monkeys', 'rabbits'].sample,
      breeds: ['', '', ''].sample,
      price: [50,25,120,350].sample,
      user: random_user
      # photo: pet_photos.sample
    )
    p.remote_photo_url = pet_photos.sample
    p.save!
    print "*"
    print "\n" if (count + 1) % 10 == 0
  end
end

def create_bookings
  User.all.each do |user|
    puts "...creating booking for #{user.first_name} #{user.last_name}!"
    checkin = Faker::Date.between(1.month.from_now, 4.month.from_now)
    Booking.create!(
      user: user,
      van: random_pet,
      checkin: start_date,
      checkout: start_date + (1..3).to_a.sample
    )
  end
end

require 'open-uri'
require "resolv-replace"

pet_photos =
  {
    cats:
    ["https://images.pexels.com/photos/7889540/pexels-photo-7889540.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/9762656/pexels-photo-9762656.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/8026728/pexels-photo-8026728.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/991831/pexels-photo-991831.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/2194261/pexels-photo-2194261.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/982865/pexels-photo-982865.jpeg?h=500&w=600"],

    dogs:
    ["https://images.pexels.com/photos/2023384/pexels-photo-2023384.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/1629781/pexels-photo-1629781.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/551628/pexels-photo-551628.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/33287/dog-viszla-close.jpg",
    "https://images.pexels.com/photos/11083473/pexels-photo-11083473.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/1851164/pexels-photo-1851164.jpeg?h=500&w=600"],

    monkeys:

    ["https://images.pexels.com/photos/4138978/pexels-photo-4138978.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/1670413/pexels-photo-1670413.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/2499760/pexels-photo-2499760.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/8026840/pexels-photo-8026840.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/2825904/pexels-photo-2825904.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/4356742/pexels-photo-4356742.jpeg?h=500&w=600"],

    rabbits:
    ["https://images.pexels.com/photos/326012/pexels-photo-326012.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/3820509/pexels-photo-3820509.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/10985455/pexels-photo-10985455.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/7945944/pexels-photo-7945944.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/6469639/pexels-photo-6469639.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/6957638/pexels-photo-6957638.jpeg?h=500&w=600"],

    birds:
    ["https://images.pexels.com/photos/56733/pexels-photo-56733.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/1418241/pexels-photo-1418241.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/1257855/pexels-photo-1257855.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/7722504/pexels-photo-7722504.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/7722489/pexels-photo-7722489.jpeg?h=500&w=600"],


    snakes:
    ["https://images.pexels.com/photos/2679440/pexels-photo-2679440.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/2062316/pexels-photo-2062316.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/6686417/pexels-photo-6686417.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/3281127/pexels-photo-3281127.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/8838073/pexels-photo-8838073.jpeg?h=500&w=600"]
  }

# destroy all instances
Booking.destroy_all
Pet.destroy_all
User.destroy_all

# admin as well as ourselves
puts "\n...create admin users!"
User.create!(first_name: "Admin", last_name: "Admin", password: "123456", email:"admin@admin.com")
User.create!(first_name: "Risako", last_name: "Nagai", password: "123456", email:"risako@nagai.com")
User.create!(first_name: "Taylor", last_name: "Mravic", password: "123456", email:"taylor@mravic.com")
User.create!(first_name: "Doug", last_name: "Theman", password: "123456", email:"doug@theman.com")
User.create!(first_name: "Trouni", last_name: "Assassin", password: "123456", email:"trouni@assassin.com")


# creates n random users and saves them in the db
addresses =
[
  "2-2, Uchisaiwai-cho 2-chome, Chiyoda-ku, Tokyo",
  "12-1, Nezu 2-chome, Bunkyo-ku, Tokyo",
  "26-5, Takadanobaba 1-chome, Shinjuku-ku, Tokyo",
  "10-22, Akasaka 8-chome, Minato-ku, Tokyo",
  "169-1122, Hamamatsucho Sekaiboekisentabiru(15-kai), Minato-ku, Tokyo",
  "448-1050, Nishishinjuku Shinjuku Sentabiru(46-kai), Shinjuku-ku, Tokyo",
  "1-15-8 Ebisu 3-chome, Shibuya-ku, Tokyo",
  "294-1032, Marunochi Gurantokyo Nosutawa(8-kai), Chiyoda-ku, Tokyo",
  "229-1277, Oizumimachi, Nerima-ku, Tokyo",
  "142-1179, Toranomon Shiroyamatorasutotawa(11-kai), Minato-ku, Tokyo",
  "448-1050, Nishishinjuku Shinjuku Sentabiru(46-kai), Shinjuku-ku, Tokyo"
]


  puts "creating #12 random users!"
  12.times do
    full = Faker::Name.name
    User.create!(
      first_name: full.split[0],
      last_name: full.split[1],
      email: Faker::Internet.email,
      password: "123456"
      # password: Faker::Internet.password(6, 12),

    )
    print "*"
    # print "\n" if (count + 1) % 10 == 0
  end


# def create_pets(n)
  # puts "creating #12 random pets!"
  # 12.times do

  pet_photos.each do |species, photos|
    photos.each do |photo|
    p = Pet.new(
      # name: Faker::FunnyName.name.split.first,
      name: Faker::Games::SuperMario.character,
      description: ['The best pet ever', 'Soft and warm', 'He will bite your toes off', 'So fun to play with'].sample(1)[0],
      location: addresses.sample,
      species: species.to_s, #['cats', 'dogs', 'monkeys', 'rabbits', 'birds', 'snakes'].sample,
      character: ['friendly', 'playful', 'happy', 'grumpy', 'speedy', 'clumsy', 'fuzzy', 'sleepy', 'supercharged'].sample,
      price: [1000,2000,3000,4000].sample,
      user: User.offset(rand(User.count)).first
      # photo: pet_photos.sample
    )

    p.save!
    # p.photo_url = pet_photos[p.species.to_sym].sample
    file = URI.open(photo)
    p.photo.attach(io: file, filename: 'pet.png', content_type: 'image/png')
    print "*"
    # print "\n" if (count + 1) % 10 == 0
  end
end


  User.all.each do |user|
    puts "...creating booking for #{user.first_name} #{user.last_name}!"
    start_date = Faker::Time.between(from: DateTime.now, to: DateTime.now + 20)
    Booking.create!(
      user: user,
      pet: Pet.offset(rand(Pet.count)).first,
      start_date: start_date,
      return_date: start_date + (1..7).to_a.sample
    )
  end


# randomizing users and pets methods
def random_user
  User.offset(rand(User.count)).first
end

  def random_pet
    Pet.offset(rand(Pet.count)).first
  end

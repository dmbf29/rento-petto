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
    "https://images.pexels.com/photos/617278/pexels-photo-617278.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/177809/pexels-photo-177809.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/69932/tabby-cat-close-up-portrait-69932.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/821736/pexels-photo-821736.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/20787/pexels-photo.jpg?h=500&w=600",
    "https://images.pexels.com/photos/1687831/pexels-photo-1687831.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/208773/pexels-photo-208773.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/590490/pexels-photo-590490.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/1404819/pexels-photo-1404819.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/2870353/pexels-photo-2870353.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/37337/cat-silhouette-cats-silhouette-cat-s-eyes.jpg?h=500&w=600",
    "https://images.pexels.com/photos/599492/pexels-photo-599492.jpeg?h=500&w=600"],

    dogs:
    ["https://images.pexels.com/photos/2023384/pexels-photo-2023384.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/1629781/pexels-photo-1629781.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/551628/pexels-photo-551628.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/11083473/pexels-photo-11083473.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/1851164/pexels-photo-1851164.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/825947/pexels-photo-825947.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/58997/pexels-photo-58997.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/1254140/pexels-photo-1254140.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/1390361/pexels-photo-1390361.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/1390784/pexels-photo-1390784.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/101635/pexels-photo-101635.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/1452717/pexels-photo-1452717.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/128817/pexels-photo-128817.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/485294/pexels-photo-485294.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/1750380/pexels-photo-1750380.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/422220/pexels-photo-422220.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/731022/pexels-photo-731022.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/800330/pexels-photo-800330.jpeg?h=500&w=600"],

    monkeys:
    ["https://images.pexels.com/photos/6822712/pexels-photo-6822712.jpegh=500&w=600",
    "https://images.pexels.com/photos/1670413/pexels-photo-1670413.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/2499760/pexels-photo-2499760.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/8026840/pexels-photo-8026840.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/2825904/pexels-photo-2825904.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/4356742/pexels-photo-4356742.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/3822505/pexels-photo-3822505.jpeg?h=500&w=600"],

    rabbits:
    ["https://images.pexels.com/photos/104373/pexels-photo-104373.jpegh=500&w=600",
    "https://images.pexels.com/photos/3820509/pexels-photo-3820509.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/10985455/pexels-photo-10985455.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/7945944/pexels-photo-7945944.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/6469639/pexels-photo-6469639.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/372166/pexels-photo-372166.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/1327599/pexels-photo-1327599.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/2883510/pexels-photo-2883510.jpeg?h=500&w=600",
    "https://images.pexels.com/photos/6897437/pexels-photo-6897437.jpeg?h=500&w=600"],

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
        file = URI.open('https://thispersondoesnotexist.com/image')
        user.avatar_photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
end
    print "*"

  end

  pet_photos.each do |species, photos|
    photos.each do |photo|
    p = Pet.new(
      name: Faker::Games::SuperMario.character,
      description: ['The best pet ever', 'Soft and warm', 'He will bite your toes off', 'So fun to play with'].sample(1)[0],
      location: addresses.sample,
      species: species.to_s,
      character: ['friendly', 'playful', 'happy', 'grumpy', 'speedy', 'clumsy', 'fuzzy', 'sleepy', 'supercharged'].sample,
      price: [1000,2000,3000,4000].sample,
      user: User.offset(rand(User.count)).first
    )

    p.save!
    file = URI.open(photo)
    p.photo.attach(io: file, filename: 'pet.png', content_type: 'image/png')
    print "*"
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

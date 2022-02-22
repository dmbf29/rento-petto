# creates n random users and saves them in the db
def create_users(n)
  puts "creating #{n} random users!"
  n.times do |count|
    full = Faker::Name.namerail
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
      name: Faker::FunnyName.name,
      description: 'the best pet ever',
      location: addresses.sample,
      species: ['cats', 'dogs', 'monkeys', 'rabbits', 'birds', 'snakes'].sample,
      character: ['friendly', 'playful', 'happy', 'grumpy', 'speedy', 'clumsy', 'fuzzy', 'sleepy', 'supercharged'].sample,
      price: [1000,2000,3000,4000].sample,
      user: random_user
      # photo: pet_photos.sample
    )
    # p.remote_photo_url = pet_photos.sample
    p.save!
    print "*"
    print "\n" if (count + 1) % 10 == 0
  end
end

def create_bookings
  User.all.each do |user|
    puts "...creating booking for #{user.first_name} #{user.last_name}!"
    start_date = Faker::Date.between(from: 1.day.from_now, to: 20.day.from_now)
    Booking.create!(
      user: user,
      pet: random_pet,
      start_date: start_date,
      return_date: start_date + (1..7).to_a.sample
    )
  end
end

# randomizing users and pets methods
def random_user
  User.offset(rand(User.count)).first
end

def random_pet
  Pet.offset(rand(Pet.count)).first
end

def pet_photos
  [
    "https://www.pexels.com/photo/gray-cat-lying-on-the-floor-7889540/",
    "https://www.pexels.com/photo/close-up-shot-of-a-tabby-cat-lying-on-a-black-textile-9762656/",
    "https://www.pexels.com/photo/close-up-shot-of-a-calico-cat-8026728/",
    "https://www.pexels.com/photo/photo-of-tabby-cat-3777622/https://www.pexels.com/photo/selective-focus-photography-of-sphinx-cat-lying-on-bedspread-991831/",
    "https://www.pexels.com/photo/photo-of-gray-and-white-tabby-kitten-sitting-on-sofa-2194261/",
    "https://www.pexels.com/photo/mid-coated-brown-cat-982865/"
  ]
end

# def pet_photos
#   {
#     # cats
#     ["https://www.pexels.com/photo/gray-cat-lying-on-the-floor-7889540/",
#     "https://www.pexels.com/photo/close-up-shot-of-a-tabby-cat-lying-on-a-black-textile-9762656/",
#     "https://www.pexels.com/photo/close-up-shot-of-a-calico-cat-8026728/",
#     "https://www.pexels.com/photo/photo-of-tabby-cat-3777622/https://www.pexels.com/photo/selective-focus-photography-of-sphinx-cat-lying-on-bedspread-991831/",
#     "https://www.pexels.com/photo/photo-of-gray-and-white-tabby-kitten-sitting-on-sofa-2194261/",
#     "https://www.pexels.com/photo/mid-coated-brown-cat-982865/"]

#     # dogs
#     ["https://www.pexels.com/photo/winking-black-and-brown-puppy-2023384/",
#     "https://www.pexels.com/photo/close-up-photo-of-dog-wearing-sunglasses-1629781/",
#     "https://www.pexels.com/photo/shallow-focus-photography-of-adult-black-and-white-border-collie-551628/",
#     "https://www.pexels.com/photo/dog-close-viszla-33287/",
#     "https://www.pexels.com/photo/cute-dog-sitting-on-the-rug-11083473/",
#     "https://www.pexels.com/photo/portrait-photo-of-an-adult-black-pug-1851164/"]

#     # monkeys

#     ["https://www.pexels.com/photo/cute-child-hugging-toy-and-sleeping-in-bed-4138978/"
#     "https://www.pexels.com/photo/focus-photography-of-gray-monkey-1670413/"
#     "https://www.pexels.com/photo/brown-monkey-in-close-up-photography-2499760/"
#     "https://www.pexels.com/photo/black-gorilla-in-close-up-photography-8026840/"
#     "https://www.pexels.com/photo/white-baboon-2825904/"
#     "https://www.pexels.com/photo/small-monkey-in-hands-of-person-4356742/"]

#     # rabbits
#     ["https://www.pexels.com/photo/close-up-of-rabbit-on-field-326012/"
#     "https://www.pexels.com/photo/white-and-black-rabbit-on-gray-textile-3820509/"
#     "https://www.pexels.com/photo/portrait-of-rabbit-10985455/"
#     "https://www.pexels.com/photo/a-rabbit-sitting-on-flowers-7945944/"
#     "https://www.pexels.com/photo/white-fluffy-bunny-in-knitted-sweater-of-owner-6469639/"
#     "https://www.pexels.com/photo/a-girl-with-her-pet-bunny-6957638/"]

#     # birds
#     ["https://www.pexels.com/photo/green-parrot-on-person-s-hand-56733/"
#     "https://www.pexels.com/photo/white-bird-perched-on-cage-1418241/"
#     "https://www.pexels.com/photo/tilt-shift-lens-of-yellow-napped-amazon-1257855/"
#     "https://www.pexels.com/photo/white-bird-with-black-beak-in-close-up-photography-7722504/"
#     "https://www.pexels.com/photo/green-bird-with-orange-beak-7722489/"
#     "https://www.pexels.com/photo/photo-of-falcon-with-blue-beak-11128382/"]


#     # snakes
#     ["https://www.pexels.com/photo/photo-of-person-holding-snake-2679440/"
#     "https://www.pexels.com/photo/brown-python-2062316/"
#     "https://www.pexels.com/photo/a-person-holding-a-snake-6686417/"
#     "https://www.pexels.com/photo/photo-of-snake-3281127/"
#     "https://www.pexels.com/photo/woman-holding-brown-snake-3445161/"
#     "https://www.pexels.com/photo/green-snake-wrapped-around-tree-branch-8838073/"]
#   }

# end

# random tokyo addresses
def addresses
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
end

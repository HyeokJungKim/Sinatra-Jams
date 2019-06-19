Artist.destroy_all
Instrument.destroy_all

10.times do
  Artist.create(name: Faker::Name.name, age: rand(1..100), bio: Faker::Hipster.sentence)
end

10.times do
  Instrument.create(name: Faker::Music.instrument, brand: Faker::Music.genre)
end

puts "File has been seeded! 🍀"

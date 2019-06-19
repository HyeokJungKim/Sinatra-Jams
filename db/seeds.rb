Artist.destroy_all
Instrument.destroy_all

10.times do
  Artist.create(name: Faker::Name.name, age: rand(1..100), bio: Faker::Hipster.sentence)
end

5.times do
  Instrument.create(name: Faker::Music.instrument, brand: Faker::Company.name)
end

richard = Artist.create(name: "Richard Park", age: 20, bio: "No one likes me")
violin = Instrument.create(name: "Violin", brand: "Stentor")
richard.instruments << violin

max = Artist.create(name: "Max Sun", age: 12, bio: "I am a kid")
piano = Instrument.create(name: "Piano", brand: "Steinway")
max.instruments << piano

puts "File has been seeded! 🍀"

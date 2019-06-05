# Artist.destroy_all

10.times do
  Artist.create(name: Faker::Name.name, age: rand(1..100), bio: Faker::Hipster.sentence)
end

puts "File has been seeded! 🍀"


# Artist.new("Tony", 70, "i'm getting older")
# Artist.new("Kevin", 45, "im no that old")
# Artist.new("Greg", 7, "i'm young")

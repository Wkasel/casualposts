# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

puts "Destroying all existing data..."
# User.destroy_all
# Category.destroy_all
# Post.destroy_all

# DATAAAA
sub_categories = [ "w4w","w4ww","w4mw","w4t","w4m",
  "w4mm","w4tt","ww4w","ww4ww","ww4mw",
  "ww4t","ww4m","ww4mm","ww4tt","mw4m",
  "mw4ww","mw4mw","mwt","mw4m","mw4mm",
  "mw4tt","t4w","t4ww","t4mw","t4t","t4m",
  "t4mm","t4tt","m4w","m4ww","m4mw","m4t",
  "m4m","m4mm","m4tt"
]

puts "create a user.."
user = User.create!({
  username: "william",
  email: "williamkasel@me.com",
  password: "will123"
})

puts "create our categories"
sub_categories.each { |cat| Category.create!({name:cat})}

puts "hopefully, this completed without errors. Done!"

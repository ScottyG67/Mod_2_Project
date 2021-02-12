# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Venue.destroy_all

user_names = ["Batman","Alfred"]
user_emails = ["imrich@batman.com","butler@batman.com"]
passwords = ["nananana","tea123"]
user_bios = ["I'm Batman","Would you like some tea, sir?"]


i = 0
while i < user_names.length
    User.create(name:user_names[i],email:user_emails[i],password:passwords[i], bio:user_bios[i])
    i +=1
end

venue_names = ["Wane Manor", "Batcave"]
venue_descriptions = ["Big fancy house", "Dark, damp, filled with bats"]
venue_locations =["Gotham City", "Gotham City"]
venue_capacity = [500,10]
venue_costs = [10000,100000]

i = 0
while i < user_names.length
    Venue.create(name:venue_names[i],description:venue_descriptions[i],location:venue_locations[i], capacity:venue_capacity[i], cost:venue_costs[i])
    i +=1
end

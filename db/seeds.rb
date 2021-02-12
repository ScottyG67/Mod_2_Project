# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

user_names = ["Batman","Alfred"]
user_emails = ["imrich@batman.com","butler@batman.com"]
passwords = ["nananana","tea123"]
user_bios = ["I'm Batman","Would you like some tea, sir?"]


i = 0
while i < user_names.length
    User.create(name:user_names[i],email:user_emails[i],password:passwords[i], bio:user_bios[i])
    i +=1
end
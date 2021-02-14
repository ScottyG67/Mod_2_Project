# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#clear database

UserEvent.destroy_all
VenueCaterer.destroy_all
Event.destroy_all
Caterer.destroy_all
User.destroy_all
Venue.destroy_all

#caterers

caterer_names = ["Best Bakers", "Top Chef"]
caterer_food_types = ["gourmet pastries", "american"]
caterer_cost_per_head = ["21.99", "40.05"]
caterer_descriptions = ["We make the best pastries in town!", "Burgers and fries are what we do!"]

i = 0
while i < caterer_names.length
    Caterer.create(name:caterer_names[i],food_type:caterer_food_types[i],cost_per_head:caterer_cost_per_head[i], description:caterer_descriptions[i])
    i +=1
end    

#users

user_names = ["Batman","Alfred"]
user_emails = ["imrich@batman.com","butler@batman.com"]
passwords = ["nananana","tea123"]
user_bios = ["I'm Batman","Would you like some tea, sir?"]


i = 0
while i < user_names.length
    User.create(name:user_names[i],email:user_emails[i],password:passwords[i], bio:user_bios[i])
    i +=1
end

#Venues

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

#Events

event_titles = ["Bad Idea", "Regrets", "Party Hardy"]
event_descriptions = ["Covid test provided afterwards.", "You might get sick but you'll have a great time.", "Party like its 2019"]
event_venues = [Venue.find_by(name:"Wane Manor").id, Venue.find_by(name:"Batcave").id, Venue.find_by(name:"Wane Manor").id]
event_caterers = [Caterer.find_by(name:"Best Bakers").id, Caterer.find_by(name:"Top Chef").id, Caterer.find_by(name:"Best Bakers").id]
event_time = [Time.now + 10000000, Time.now + 20000000, Time.now - 50000000]
event_duration = [5,1,24]

i = 0
while i < event_titles.length
    Event.create(title:event_titles[i],description:event_descriptions[i],venue_id:event_venues[i], caterer_id:event_caterers[i],time:event_time[i],durations_hours: event_duration[i])
    i +=1
end


#users attending events


UserEvent.create(user_id:User.all[0].id, event_id:Event.all[0].id, organizer: true)
UserEvent.create(user_id:User.all[1].id, event_id:Event.all[0], organizer: false)
UserEvent.create(user_id:User.all[0].id, event_id:Event.all[1].id, organizer: false)
UserEvent.create(user_id:User.all[1].id, event_id:Event.all[1].id, organizer: true)
UserEvent.create(user_id:User.all[0].id, event_id:Event.all[2].id, organizer: true)
UserEvent.create(user_id:User.all[1].id, event_id:Event.all[2].id, organizer: false)



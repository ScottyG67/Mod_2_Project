# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Caterer.destroy_all

caterer_names = ["Best Bakers", "Top Chef"]
caterer_food_types = ["gourmet pastries", "american"]
caterer_cost_per_head = ["21.99", "40.05"]
caterer_descriptions = ["We make the best pastries in town!", "Burgers and fries are what we do!"]

    i = 0
    while i < caterer_names.length
        Caterer.create(name:caterer_names[i],food_type:caterer_food_types[i],cost_per_head:caterer_cost_per_head[i], description:caterer_descriptions[i])
        i +=1
    end    
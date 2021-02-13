class Caterer < ApplicationRecord
    has_many :venue_caterers
    has_many :venues, through: :venue_caterers
    has_many :events


    #add code to capitalize every word of Food_type titleize will do it

end

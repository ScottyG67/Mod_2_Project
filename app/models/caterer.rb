class Caterer < ApplicationRecord
    has_many :venue_caterers
    has_many :venues, through: :venue_caterers
    has_many :events

    validates :name, presence: true
    validates :food_type, presence: true
    validates :cost_per_head, presence: true
    validates :cost_per_head, numericality: {greater_than: 0}, allow_nil: true


    #add code to capitalize every word of Food_type titleize will do it

end

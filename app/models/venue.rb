class Venue < ApplicationRecord
    has_many :venue_caterers
    has_many :caterers, through: :venue_caterers
    has_many :events

    validates :name, presence: true
    validates :name, uniqueness: true
    validates :capacity, numericality: {greater_than: 0}
    validates :cost, numericality: {greater_than: 0}


end

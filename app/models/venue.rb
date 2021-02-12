class Venue < ApplicationRecord
    has_many :venue_caterers
    has_many :caterers, through: :venue_caterers
end

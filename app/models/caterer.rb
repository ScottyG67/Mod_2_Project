class Caterer < ApplicationRecord
    has_many :venue_caterers
    has_many :venues, through: :venue_caterers
end

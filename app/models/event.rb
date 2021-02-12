class Event < ApplicationRecord
  belongs_to :venue
  belongs_to :caterer
end

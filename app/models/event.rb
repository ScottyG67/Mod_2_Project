class Event < ApplicationRecord
  belongs_to :venue
  belongs_to :caterer
  has_many :user_events
  has_many :users, through: :user_events
end

class Event < ApplicationRecord
  belongs_to :venue
  belongs_to :caterer
  has_many :user_events
  has_many :users, through: :user_events

#returns object of user that is the organizer of the event in the user_events table
  def host
    user_list(true)[0]
  end

#returns array of user object that are assoicated with event in user_events but are not the event organizer
  def guest_list
    user_list(false)
  end

  private
  #takes in arguement of true or false. Returns array of users. True = users array are organizers, False = User array are guests.
  def user_list(is_organizer)
    user_event_list = self.user_events.select {|user_event| user_event.organizer == is_organizer}
    user_event_list.map {|user_event| user_event.user}
  end
end

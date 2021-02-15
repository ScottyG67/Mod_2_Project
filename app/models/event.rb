class Event < ApplicationRecord
  belongs_to :venue
  belongs_to :caterer
  has_many :user_events
  has_many :users, through: :user_events

  validates :title, presence: true
  validates :time, presence: true
  validates :durations_hours, presence: true,
                            numericality: {greater_than: 0}, allow_nil: true 
  # validates :caterer_id, presence:true#,
  #                       #inclusion: {in: VenueCaterer.select{|item| item.caterer_id == caterer_id}}

  # validates :venue_id, presence: true

  validates :durations_hours, numericality: {greater_than: 0}, allow_nil: true

  # #validates :caterer_id, inclusion: {in: VenueCaterer.select{|item| item.caterer_id == caterer_id}}





  




#returns object of user that is the organizer of the event in the user_events table
  def host
    user_list(true)[0]
  end

#returns array of user object that are assoicated with event in user_events but are not the event organizer
  def guest_list
    user_list(false)
  end

#returns date formatted Sunday, January 31, 2021. If time is nil returns string"
  def formal_date
    if self.time
      self.time.strftime("%A, %B %d, %Y")
    else
      "TBD"
    end
  end

  def start_time
    if self.time
      self.time.strftime("%l:%M %P")
    else
      "TBD"
    end
  end

#returns array of event objects that are scheduled for the future. sorted by date
  def self.upcoming
    self.all.select {|event| event.time >= Time.now}.sort_by{|event| event.time}
  end
  #returns array of event objects that are scheduled for the past. sorted by date
  def self.past
    self.all.select {|event| event.time < Time.now}.sort_by{|event| event.time}
  end

#calculate current guest list length
def attendance
  self.users.count
end



  private
  #takes in arguement of true or false. Returns array of users. True = users array are organizers, False = User array are guests.
  def user_list(is_organizer)
    user_event_list = self.user_events.select {|user_event| user_event.organizer == is_organizer}
    user_event_list.map {|user_event| user_event.user}
  end
end

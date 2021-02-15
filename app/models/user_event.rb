class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event

  #validations
  validates :user_id, presence: true,
                    uniqueness: {scope: :event_id, message: "You are already signed up to attend."}
  validates :event_id, presence: true
  #validates :organizer, uniqueness: {scope: :event_id}, allow_nil: true




  # def add_guest (event_id, user_id_array)
  #   UserEvent.find_or_create
  # end

end

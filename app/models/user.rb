class User < ApplicationRecord
   has_many :user_events
   has_many :events, through: :user_events

   
   validates :name, presence: true
   validates :email, presence: true
   validates :password, presence: true
   validates :email, uniqueness: true, allow_nil: true #only validates if email is filled in.
   validates :password, length: {in: 8..20}, allow_nil: true #only validates if password is filled in.

end

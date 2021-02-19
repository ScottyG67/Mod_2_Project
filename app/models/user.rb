class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   has_many :user_events, :dependent => :destroy
   has_many :events, through: :user_events
   has_one_attached :avatar
   enum role: [:normal, :admin]

   
   #validates :name, presence: true
   validates :email, presence: true
   validates :password, presence: true
   validates :email, uniqueness: true, allow_nil: true #only validates if email is filled in.
   validates :password, length: {in: 8..20}, allow_nil: true #only validates if password is filled in.

end

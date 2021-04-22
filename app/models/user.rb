class User < ApplicationRecord
  enum role: { buyer: "buyer", broker: "broker", admin: "admin" } 
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable

  validates :firstname, allow_blank: false, presence: true
  validates :lastname, allow_blank: false, presence: true


end

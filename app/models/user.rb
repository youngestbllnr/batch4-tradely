class User < ApplicationRecord
  enum role: { buyer: 0, broker: 1, admin: 2 } 
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable

  validates :firstname, allow_blank: false, presence: true
  validates :lastname, allow_blank: false, presence: true


end

class User < ApplicationRecord
  has_many :brokers_stocks, dependent: :destroy
  has_many :stocks, through: :broker_stocks
  has_many :buyers_stocks, dependent: :destroy
  has_many :stocks, through: :buyer_stocks
  has_many :transactions

  enum role: { buyer: 'buyer', pending_broker: 'pending_broker', broker: 'broker', admin: 'admin' }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable

  validates :firstname, allow_blank: false, presence: true
  validates :lastname, allow_blank: false, presence: true
end

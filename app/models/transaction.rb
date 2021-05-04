class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :buyers_stock
end

class BuyersStock < ApplicationRecord
    belongs_to :transaction
    belongs_to :user
end

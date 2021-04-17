class Role < ApplicationRecord
  belongs_to :user

  CATEGORIES = %w( admin broker buyer ).freeze
  validates :category, presence: true, inclusion: { in: CATEGORIES }
end

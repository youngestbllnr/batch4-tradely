class Stock < ApplicationRecord
  enum on_sale: { for_sale: true,  Not_for_sale: false} 
  belongs_to :user
end

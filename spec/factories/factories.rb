FactoryBot.define do
 factory :user do
     firstname {"Juan"}
     lastname {"Dela cruz"}
     sequence(:email) { |n| "test-#{n.to_s.rjust(3, "0")}@sample.com"}
     password {"user1234"}
     role {"broker"}
    end
 factory :stock do
    symbol {"MSFT"}
    company_name {"microsoft Corporation"}
    current_price {251.20}
    change {0.4}
    previous_close {261.15}
    on_sale {false}
    user_id {:user_id}
    association :user
    end
end
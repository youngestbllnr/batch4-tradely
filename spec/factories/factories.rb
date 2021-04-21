FactoryBot.define do
 factory :user do
     sequence(:email) { |n| "test-#{n.to_s.rjust(3, "0")}@sample.com"}
     password {"1234"}
    end
end
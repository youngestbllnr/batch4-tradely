FactoryBot.define do
 factory :user do
     firstname {"Juan"}
     lastname {"Dela cruz"}
     sequence(:email) { |n| "test-#{n.to_s.rjust(3, "0")}@sample.com"}
     password {"user1234"}
     role {0}
    end
end
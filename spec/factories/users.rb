FactoryBot.define do
    factory :user do
      email { "test@tradely.com" }
      password { "password" }
      password_confirmation { "password" }
      firstname { "John" }
      lastname { "Doe" }
  
      trait :buyer do
        role { "buyer" }
      end

      trait :pending_broker do
        role { "pending_broker" }
      end
  
      trait :broker do
        role { "broker" }
      end
  
      trait :admin do
        role { "admin" }
      end
    end
  end
  
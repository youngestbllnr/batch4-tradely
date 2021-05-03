FactoryBot.define do
  factory :user do
    email { 'test@tradely.com' }
    password { 'password' }
    password_confirmation { 'password' }
    firstname { 'John' }
    lastname { 'Doe' }
    role { 'buyer' }

    trait :buyer do
      role { 'buyer' }
      email { 'buyer@tradely.com' }
    end
    trait :pending_broker do
      role { 'pending_broker' }
      email { 'pending_broker@tradely.com' }
    end

    trait :broker do
      role { 'broker' }
      email { 'broker@tradely.com' }
    end

    trait :admin do
      role { 'admin' }
    end
  end
end

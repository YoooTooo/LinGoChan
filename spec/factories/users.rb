FactoryBot.define do
  factory :user, class: User  do
    name { 'Example User' }
    sequence(:email) { |n| "user_#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
    activated { true }
  end

  factory :not_activated_user, class: User do
    name { 'Example User' }
    sequence(:email) { |n| "user_#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end

    factory :other_user, class: User do
        name { 'Sato jirou' }
        email { 'sato@rails.com' }
        password { 'foobar' }
        password_confirmation { 'foobar' }
        admin { 'false' }
        activated { true }
      end

end

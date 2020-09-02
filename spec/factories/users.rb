FactoryBot.define do
  factory :user do
    name { 'Example User' }
    sequence(:email) { |n| "user_#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :activated_user do
    name { 'Example User' }
    sequence(:email) { |n| "user_#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
    activated { true }
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

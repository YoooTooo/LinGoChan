

FactoryBot.define do
  factory :user, class: User  do
    name { 'Example User' }
    sequence(:email) { |n| "user_#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
    activated { true }
  end

  factory :administrator, class: User do
      name { 'administrator' }
      email { 'admin@saikyo.com' }
      password { 'administrator' }
      password_confirmation { 'administrator' }
      admin { 'true' }
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

      factory :customized_user, class: User do
          id { 999 }
          name { 'toyotoyo' }
          email { 'toyotoyo@example.com' }
          password { 'toyotoyo' }
          password_confirmation { 'toyotoyo' }
          admin { 'false' }
          activated { true }
          activation_digest { authenticated?(:activation, 999) }
          activated_at { Time.zone.now }
        end

end

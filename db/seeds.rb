# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "りんごちゃん",
             email: "example@example.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

5.times do |n|
 name  = Faker::Name.name
 email = "example-#{n+1}@example.org"
 password = "password"
 User.create!(name:  name,
              email: email,
              password:              'foobar',
              password_confirmation: 'foobar',
              activated: true,
              activated_at: Time.zone.now)
end

User.create!(name:  "リ　シウ",
            email: "example10@example.org",
            password:              "foobar",
            password_confirmation: "foobar",
            admin: false,
            activated: true,
            activated_at: Time.zone.now)

User.create!(name:  "Justin chow",
             email: "example11@example.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "金　奈恩",
            email: "example12@example.org",
            password:              "foobar",
            password_confirmation: "foobar",
            admin: false,
            activated: true,
            activated_at: Time.zone.now)

User.create!(name:  "ほはちゃむ",
            email: "example13@example.org",
            password:              "foobar",
            password_confirmation: "foobar",
            admin: false,
            activated: true,
            activated_at: Time.zone.now)

User.create!(name:  "リカルド　マーセナス",
            email: "example14@example.org",
            password:              "foobar",
            password_confirmation: "foobar",
            admin: false,
            activated: true,
            activated_at: Time.zone.now)

User.create!(name:  "さんちゃん",
            email: "example15@example.org",
            password:              "foobar",
            password_confirmation: "foobar",
            admin: false,
            activated: true,
            activated_at: Time.zone.now)

User.create!(name:  "助D",
            email: "example16@ex.org",
            password:              "foobar",
            password_confirmation: "foobar",
            admin: false,
            activated: true,
            activated_at: Time.zone.now)

User.create!(name:  "星　林",
            email: "example17@railstutorial.org",
            password:              "foobar",
            password_confirmation: "foobar",
            admin: false,
            activated: true,
            activated_at: Time.zone.now)

User.create!(name:  "桜木　レイラ",
            email: "example@18railstutorial.org",
            password:              "foobar",
            password_confirmation: "foobar",
            admin: false,
            activated: true,
            activated_at: Time.zone.now)

User.create!(name:  "レオン　オズワルド",
            email: "example@18railstutorial.org",
            password:              "foobar",
            password_confirmation: "foobar",
            admin: false,
            activated: true,
            activated_at: Time.zone.now)

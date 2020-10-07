source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'
# ハッシュ化のためのgem
gem 'bcrypt', '3.1.15'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
# Use mysql as the database for Active Record
gem 'mysql2', '~>0.5.3'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sassc'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  # to generate samples
  gem 'factory_bot_rails'
  # to test validations
  gem 'shoulda-matchers'
end

# rubocopの導入
gem 'rubocop', require: false
gem 'rubocop-performance'
gem 'rubocop-rails'
gem 'rubocop-rspec'

# rspecの導入
group :development, :test do
  gem 'rspec-rails'
end

#assignsメソッドを使用するために
group :test do
  gem 'rails-controller-testing'
end

#annotateの導入
gem 'annotate'

#エラーメッセージ日本語化
gem 'rails-i18n'

#フェイクユーザーを入れる
gem 'faker', '1.7.3'

#ページネーションのためのgem
gem 'kaminari'

#開発環境で送信したメールを確認するgem
group :development do
  gem 'letter_opener_web'
  gem 'pry-byebug'
end

#画像アップロードのためのgem
gem 'carrierwave', '1.2.2'

#画像のリサイズのためのgem
gem 'mini_magick',">= 4.9.4"

group :production do
  #AWSのS3を使うためのgem
  gem 'fog-aws'
end

#パンくずリストのためのgem
gem "gretel"

#本番環境用
group :production do
  gem 'unicorn'
end

#envファイル作成のためのgem
gem 'dotenv-rails'

#カピストラーノのためのgem
group :development, :test do
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

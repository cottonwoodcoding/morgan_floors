source 'https://rubygems.org'

gem 'rails', '4.0.4'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'sass-rails', '~> 4.0.2'
gem 'haml-rails'
gem 'autoprefixer-rails'
gem 'uglifier', '>= 1.3.0'
gem "font-awesome-rails"
gem 'devise'
gem 'underscore-rails'
gem 'protected_attributes'
gem 'simple_form'
gem 'picasa'
gem 'rack-cache'
gem 'activerecord-session_store', github: 'rails/activerecord-session_store'
gem 'simple_oauth', '~> 0.2.0'
gem 'modernizr-rails'
gem 'curb'
gem 'feedjira'
gem 'sendgrid'
gem 'gmaps4rails'

# Makes running your Rails app easier. Based on the ideas behind 12factor.net
gem 'rails_12factor'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

ruby '2.0.0'

group :production do
  gem 'heroku-deflater'
  gem 'pg'
  gem 'unicorn'
end

group :development, :test do
   gem 'rspec-rails', '~> 3.0.0'
   gem 'byebug'
   gem 'pry'
   gem 'sqlite3'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

source 'https://rubygems.org'
ruby "2.6.8"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'

gem "paperclip", "~> 4.3"
gem 'aws-sdk', '< 2.0'
gem 'devise'
gem 'rqrcode'

gem 'bourbon'
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'unicorn'
gem 'unicorn-rails'

gem 'coordinate-converter'
gem 'rails_12factor'

group :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'
  gem 'sqlite3'
end

group :development do
  gem 'faker', '~> 1.4.3'
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'sqlite3'
  gem 'spring'
  gem 'capistrano', '~> 3.4.0', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rbenv', require: false
  gem 'capistrano-unicorn-nginx', require: false
end

group :production do
  gem 'pg'
end

source 'https://rubygems.org'
ruby "2.6.8"


gem 'rails', '4.2.11.3'

gem 'paperclip', '~> 5.2'
gem 'aws-sdk', '~> 2.3'
gem 'devise'
gem 'rqrcode'

gem 'bourbon', '~> 4.1.1'
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
  gem 'rspec-rails', '~> 3.1'
  gem 'factory_bot_rails'
  gem 'sqlite3', '~> 1.3.6'
end

group :development do
  gem 'faker', '~> 1.4.3'
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'sqlite3', '~> 1.3.6'
  gem 'spring'
  gem 'capistrano', '~> 3.4.0', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rbenv', require: false
  gem 'capistrano-unicorn-nginx', require: false
end

group :production do
  gem 'pg', '~> 0.15'
end

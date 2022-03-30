source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.2"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 6.0.0"
# Use sqlite3 as the database for Active Record
gem "sqlite3", "~> 1.4"
# Use Puma as the app server
gem "puma", "~> 3.11"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.7"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'
# authentication
gem "bcrypt"
gem "rack-cors"
gem "jwt"
# gem 'devise'
# gem 'devise-jwt'
# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.6", require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'
#
# format logs and reduce default logs
gem "dotenv-rails"
# gem 'lograge'
# gem 'logstash-event'
# Elasticsearch integration
# gem 'elasticsearch-model','~> 5'
# gem 'elasticsearch-rails'

group :development, :test do
  gem "awesome_print"
  gem "better_errors"
  gem "pry-byebug", source: "http://rubygems.org/"
  gem "pry-rails"
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
end

group :test do
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "faker"
  gem "simplecov", require: false
  gem "database_cleaner", "1.6.1"
  gem "shoulda-matchers", require: false
  gem "rubocop-rspec", require: false
  # gem 'elasticsearch-extensions'
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

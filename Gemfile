source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'

# ActiveRecord-like associations for ActiveResource
gem 'activeresource', '~> 4.0.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
gem 'bootstrap-sass', '~> 3.2.0.2'

gem 'httparty'

# Making it easy to serialize models for client-side use
gem 'active_model_serializers', '~> 0.9.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 2.5.3'

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 3.1.2'

gem 'tzinfo-data'

gem 'metric_fu'

group :production do
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'rails_12factor', '~> 0.0.2'
  
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', '~> 0.4.1'
end

group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 1.1.3'
  gem 'dotenv-rails', '~> 0.11.1'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.1.0'
  gem 'thin', '~> 1.6.2'
  gem 'pry-byebug', '~> 2.0.0'
end

group :test do  
  gem 'factory_girl_rails', '~> 4.4.1'
  gem 'faker', '~> 1.4.3'
end

# For help with heroku and timeouts
gem 'rack-timeout', '~> 0.0.4'

group :production do
  #gem 'unicorn', '~> 4.8.3'
end

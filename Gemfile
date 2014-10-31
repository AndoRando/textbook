source 'https://rubygems.org'

ruby '2.1.4'

gem 'rails', '~> 4.0.4'
gem 'pg'
gem 'unicorn'
gem 'rack-timeout'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'devise'
gem 'cancan'
gem 'paranoia'
gem 'friendly_id'
gem 'inherited_resources'
gem 'textacular'
gem 'newrelic_rpm'
gem 'uglifier'
gem 'redcarpet'

group :development do
  gem 'spork-rails'
  gem 'guard'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'guard-bundler'
  gem 'rb-fsevent'
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test, :development do
  gem 'rspec-rails', '~> 2.0'
  gem 'pry'
end

group :test do
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'poltergeist'
  gem 'capybara'
  gem 'launchy'
end

group :production do
  gem 'rails_12factor'
  gem 'lograge'
  gem 'bugsnag'
  gem 'oink'
end
